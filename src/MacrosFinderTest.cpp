#include <pcrecpp.h>	
#include <iostream>	
#include "MacrosFinder.h"
#include "MacrosFinderTest.h"

void MacrosFinderTest::TestFindMacros()
{
    const char* errorMessage = "find all unique macros names which body is string";
    
    MacrosFinder finder;
    string list = finder.findMacros();
    string expectedList = "#define PACKAGE_NAME \"PostgreSQL\"\n#define PACKAGE_VERSION \"9.1.3\"\n#define PACKAGE_BUGREPORT \"\"";
    
    CPPUNIT_ASSERT_MESSAGE(errorMessage, list == expectedList);
}