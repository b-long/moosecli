import tempfile
import unittest
import os
from moosecli.lib import do_thing_with_package_data

class LibTest(unittest.TestCase):

    def test_do_thing_with_package_data(self):
        test_name = "Johnny Test"
        with tempfile.NamedTemporaryFile() as tmpfile:
            print(tmpfile.name)
            assert os.path.getsize(tmpfile.name) == 0
            do_thing_with_package_data(test_name, tmpfile.name)
            
            assert os.path.getsize(tmpfile.name) >= 1

