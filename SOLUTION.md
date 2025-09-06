Implemented UrlCount program in java using map reduce framework. Hadoop was used (Hadoop was executed both on CSHELL and dataproc environment).
Map extracted the hrefs using regex. Combiner combined the count for the keys (hrefs) and reducer totalled it.

note:- AI was used to generate regex patterns and debugging for dataproc environment

\#	20
/wiki/Doi_(identifier)	18
/wiki/Google_File_System	6
/wiki/ISBN_(identifier)	18
/wiki/MapReduce	7
/wiki/S2CID_(identifier)	14
mw-data:TemplateStyles:r1129693374	7
mw-data:TemplateStyles:r1238218222	121
mw-data:TemplateStyles:r1295599781	33
mw-data:TemplateStyles:r886049734	12

Combiner issue:
I filtered URLs at the reducer level, and did not filter keys at the combiner level, so I got the correct result.

Comparison
<img width="1674" height="519" alt="Screenshot 2025-09-05 195920" src="https://github.com/user-attachments/assets/7a6b096e-cae0-422f-bf22-9960cf7bfc2d" />
with 1 master and 2 workers
<img width="1105" height="587" alt="Screenshot 2025-09-05 200750" src="https://github.com/user-attachments/assets/0b4c3d1c-561f-4c73-9e74-d922fa6d5082" />
with 1 master and 4 workers

The real time and system time increase for the second one, but user time decreases.
This may be explained by: increasing workers distributes the data processing workload per node, but increases overhead by adding in the time taken for data transfer between nodes and complexity for coordination and task scheduling. The increase in real time conveys the fact that the workload is so small that the distribution of it causes more harm by introducing various overheads.

