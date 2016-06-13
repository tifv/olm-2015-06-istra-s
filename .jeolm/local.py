from jeolm.driver.groups import GroupsDriver
from jeolm.driver.authors import AuthorsDriver
from jeolm.driver.addtoc import AddToCDriver
from jeolm.driver.source_link import SourceLinkDriver

class Driver(GroupsDriver, AuthorsDriver, AddToCDriver, SourceLinkDriver):

    def _select_outname(self, target, metarecord, date=None):
        return super()._select_outname(target, metarecord, date=None)

