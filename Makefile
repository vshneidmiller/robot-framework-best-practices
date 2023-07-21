TARGET := "robot/tests/"
ROBOCOP_EXCLUDED_RULES := missing-doc-test-case
INCLUDE = "regressionORsmoke"

.PHONY: test
test:
	( \
           source ~/robot_virtualenv/bin/activate; \
           pip install -Ur requirements.txt; \
           robot --outputdir results --exclude exclude $(TARGET); \
           open	results/report.html; \
           deactivate \
    )

.PHONY: test_parallel
test_parallel_suite_level_split:
	( \
           source ~/robot_virtualenv/bin/activate; \
           pip install -Ur requirements.txt; \
           pabot --processes 100 --outputdir results --exclude exclude $(TARGET); \
           open	results/report.html; \
           deactivate \
    )

.PHONY: test_parallel_test_level_split
test_parallel_test_level_split:
	( \
           source ~/robot_virtualenv/bin/activate; \
           pip install -Ur requirements.txt; \
           pabot --testlevelsplit --processes 100 --exclude exclude --outputdir results $(TARGET); \
           open	results/report.html; \
           deactivate \
    )

.PHONY: test_serial_and_parallel
test_serial_and_parallel:
	( \
           source ~/robot_virtualenv/bin/activate; \
           pip install -Ur requirements.txt; \
           robot --outputdir results/robot/ --exclude exclude robot/tests/tags.robot; \
           pabot --processes 10 --outputdir results/pabot/ --exclude exclude robot/tests/parallel/; \
           rebot --output rebot/output.xml --log rebot/log.html --report rebot/report.html results/robot/output.xml results/pabot/output.xml; \
           open	rebot/report.html; \
           deactivate \
    )   

#https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#randomizing-execution-order
#The test execution order can be randomized using option --randomize
test_parallel_randomize:
	( \
           source ~/robot_virtualenv/bin/activate; \
           pip install -Ur requirements.txt; \
           pabot --processes 10 --randomize ALL --outputdir results --exclude exclude $(TARGET); \
           open	results/report.html; \
           deactivate \
    )

#run only specific tags
#https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#using-command-line-options
#--include fooANDbar     # Matches tests containing tags 'foo' and 'bar'.
#--include fooORbar      # Matches tests containing either tag 'foo' or tag 'bar'.
#--include fooNOTbar     # Matches tests containing tag 'foo' but not tag 'bar'.

test_specific_tags:
	( \
           source ~/robot_virtualenv/bin/activate; \
           pip install -Ur requirements.txt; \
           robot --outputdir results --include $(INCLUDE) --exclude exclude $(TARGET); \
           open	results/report.html; \
           deactivate \
    )

#https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#dry-run
#Robot Framework supports so called dry run mode where the tests are run normally otherwise,
#but the keywords coming from the test libraries are not executed at all.
#The dry run mode can be used to validate the test data; if the dry run passes, the data should be syntactically correct
dry_run:
	( \
           source ~/robot_virtualenv/bin/activate; \
           pip install -Ur requirements.txt; \
           robot --outputdir results --dryrun $(TARGET); \
           open	results/report.html; \
           deactivate \
    )

# https://robocop.readthedocs.io/en/stable/
# Robocop is a tool that performs static code analysis of Robot Framework code.
robocop:
	( \
           source ~/robot_virtualenv/bin/activate; \
           robocop --exclude $(ROBOCOP_EXCLUDED_RULES) $(TARGET) \
    )

# https://robotidy.readthedocs.io/en/stable/index.html#
# Robotidy is a tool for autoformatting Robot Framework code.
robotidy:
	( \
           source ~/robot_virtualenv/bin/activate; \
           robotidy $(TARGET) \
    )
