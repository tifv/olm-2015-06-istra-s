import re
from collections import OrderedDict
from datetime import date as date_type

from jeolm.record_path import RecordPath
from jeolm.flags import FlagContainer
from jeolm.fancify import fancifying_print as fprint

def main(listed_groups, *, driver,
    from_date=None, to_date=None,
    tab=(' ' * 4)
):
    timetable = OrderedDict(
        (group, OrderedDict(
            (date, OrderedDict(
                (period, []) for period in periodlist
            ))
            for date, periodlist in groupvalue['timetable'].items()
        ))
        for group, groupvalue in driver.groups.items()
    )
    root_record = driver[RecordPath()]
    for group, group_timetable in timetable.items():
        _key, group_timetable_extra = driver.select_flagged_item(
            root_record, '$timetable$extra', FlagContainer({group}))
        if group_timetable_extra is None:
            continue
        for date, date_value in group_timetable_extra.items():
            if date_value is None:
                continue
            for period, extra in date_value.items():
                if extra is None:
                    continue
                assert isinstance(extra, str), type(extra)
                if 'MISSING' in extra:
                    extra = "<RED><BOLD>{}<RESET>".format(extra)
                else:
                    extra = "<YELLOW>{}<RESET>".format(extra)
                group_timetable[date][period].append(extra)
    for metapath, metarecord, group, date, period in driver.list_timetable():
        #if not metarecord.get('$list-timetable$able', True):
        #    continue
        timetable[group][date][period].append(
            "<GREEN>{caption}<RESET> by <CYAN>{authors}<RESET> ({metapath})"
            .format(
                caption=driver._find_caption(metarecord),
                authors=driver._constitute_authors(
                    metarecord['$authors'], thin_space=' ' ),
                metapath=metapath,
            ) )
    if listed_groups is None:
        listed_groups = list(driver.groups)
    for group in listed_groups:
        fprint( "<MAGENTA>=== <BOLD>{}<RESET><MAGENTA> ===<RESET>"
            .format(group) )
        for date, date_value in timetable[group].items():
            if not any(date_value.values()) and date > date_type.today():
                continue
            if from_date is not None and date < from_date:
                continue
            if to_date is not None and date > to_date:
                continue
            fprint(tab + "<CYAN><BOLD>{}<RESET>".format(date))
            for period, value in date_value.items():
                assert isinstance(value, list), type(value)
                if not value:
                    value = "<RED><BOLD>MISSING<RESET>"
                else:
                    value = ', '.join(value)
                fprint( tab + tab + "<CYAN>{}: <RESET>{}"
                    .format(period, value) )

date_pattern = re.compile(
    '^(?P<year>[0-9]{4})-(?P<month>[0-9]{2})-(?P<day>[0-9]{2})$' )


def _date_arg(s):
    match = date_pattern.match(s)
    if match is None:
        raise RuntimeError(s)
    return date_type(
        year=int(match.group('year')),
        month=int(match.group('month')),
        day=int(match.group('day')), )

if __name__ == '__main__':
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument('groups', nargs='*')
    parser.add_argument('--from-date', type=_date_arg)
    parser.add_argument('--to-date', type=_date_arg)
    args = parser.parse_args()
    if args.groups:
        groups = args.groups
    else:
        groups = None

    import jeolm.commands
    driver = jeolm.commands.simple_load_driver()
    main(groups, from_date=args.from_date, to_date=args.to_date, driver=driver)

