*** Comments ***
# https://github.com/robotframework/HowToWriteGoodTestCases/blob/master/HowToWriteGoodTestCases.rst#documentation


*** Settings ***
Documentation       Test suite documentation
...                 Often a good idea to add overall documentation to test case files.
...                 Should contain background information, why tests are created, notes about execution environment, etc.
...                 Do not just repeat test suite name.
...                 Better to have no documentation if it is not really needed.
...                 Do not include too much details about test cases.
...                 Tests should be clear enough to understand alone.
...                 Duplicate information is waste and maintenance problem.
...                 Documentation can contain links to more information.
...                 Consider using test suite metadata if you need to document information represented as name-value pairs (e.g. Version: 1.0 or OS: Linux).
...                 Documentation and metadata of the top level suite can be set from the command line using --doc and --metadata options, respectively.
Metadata            Version    0.1
