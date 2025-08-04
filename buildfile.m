function plan = buildfile
import matlab.buildtool.tasks.*
import matlab.unittest.plugins.CodeCoveragePlugin
import matlab.unittest.plugins.codecoverage.CoverageResult

plan = buildplan(localfunctions);

plan("check") = CodeIssuesTask;
plan("test") = TestTask(Dependencies="check",...
    TestResults="test-results/results.xml");

plan.DefaultTasks = ["check" "test"];
end


