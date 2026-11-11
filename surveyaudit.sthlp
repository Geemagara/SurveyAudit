{smcl}
{* *! version 2.0.0  09Nov2026}{hline}
{help manpage:surveyaudit} — Automated master pipeline execution and log-auditing toolkit for Stata

{marker syntax}{title:Syntax}

{p 8 17 2}
{cmd:surveyaudit} [{cmd:,} {opt rootpath(string)} {opt dopath(string)} {opt logpath(string)} {opt docpath(string)}]


{marker description}{title:Description}

{pstd}
{cmd:surveyaudit} is a production-grade toolbox designed to automate the execution, error tracking, and auditing of multi-stage Stata do-file pipelines, particularly tailored for complex household and socio-economic survey processing (such as LSMS, DHS, or national statistical office surveys).

{pstd}
In traditional master scripts, a single syntax error, memory restriction, or merge mismatch in an individual section script halts the entire multi-hour run, forcing researchers to manually hunt through massive log files. {cmd:surveyaudit} introduces software-engineering CI/CD practices—including fault-tolerant execution trapping, low-level log parsing, and dynamic Markdown executive report generation—directly into Stata environments.


{marker options}{title:Options}

{phang}
{opt rootpath(string)} specifies the root folder path of the survey project. When provided, the command automatically resolves dependent paths and can source {cmd:init.do}.

{phang}
{opt dopath(string)} explicitly specifies the directory path containing section do-files (overrides default).

{phang}
{opt logpath(string)} explicitly specifies the directory path where execution log files are stored.

{phang}
{opt docpath(string)} explicitly specifies the directory path where Markdown audit reports and status reports are saved.


{marker workflow}{title:Workflow}

{pstd}
The generic workflow for executing a survey processing pipeline using {cmd:surveyaudit} is as follows:

{phang}
1. Initialize your project path structure (containing your Do files, Log folder, and Documents/Reports folder).{p_end}
{phang}
2. Execute the pipeline with a single command:{p_end}
{p 8 12 2}
{cmd:. surveyaudit, rootpath("C:\YourProjectDirectory")}

{pstd}
The command sequentially loops through your configured queue of section do-files. Successful modules complete cleanly, while failing scripts automatically capture their return codes ({cmd:_rc}) without stopping the execution loop. For any failing script, native low-level file commands scan the corresponding log file, extract the final 25 lines of failure context, and compile an independent Markdown diagnostic report.

{pstd}
Finally, all module statuses and wide-format merge summaries are consolidated into a single master executive audit report ({cmd:00_Do_Files_Submission_Status_Report.md}) for rapid review and debugging.


{marker remarks}{title:Remarks}

{pstd}
1. {bf:Folder Structure:} A clean, structured directory layout (separating do-files, logs, raw data, and documentation reports) is recommended to maximize the automation and auditing features of this toolkit.

{pstd}
2. {bf:Low-Level File Operations:} {cmd:surveyaudit} utilizes Stata's native low-level file manipulation commands ({cmd:file open}, {cmd:file read}, {cmd:file write}) to manage data streams safely, prevent file-lock conflicts ({cmd:r(691)}), and compile structured Markdown text files on the fly.

{pstd}
3. {bf:Error-Trapping & Resilience:} By wrapping module execution in {cmd:capture noisily do}, the engine ensures that long-running survey pipelines remain robust, isolating script-level failures while preserving overall system execution.

{pstd}
4. {bf:Active Development & Feedback:} As an open-source tool for applied quantitative researchers, feedback, bug reports, and suggestions for feature enhancements are always welcome.


{marker citation}{title:Citation}

{pstd}
If you utilize this software package in your research or institutional data production pipeline, please cite it accordingly:

{phang}
Magara, G. 2026. {it:surveyaudit: Automated master pipeline execution and log-auditing toolkit for Stata}. GitHub Repository / Open-Source Utility.


{marker author}{title:Author}

{pstd}
George Magara{break}
Kenya National Bureau of Statistics (KNBS) / Independent Quantitative Data Architect{break}
Please report bugs, issues, and feature requests via your repository issue tracker or project support channels.


{marker also_see}{title:Also see}

{pstd}
Manual:  {hi:[P] capture}, {hi:[P] file}, {hi:[R] log}, {hi:[P] version}
{p_end}
