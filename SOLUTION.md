Implemented UrlCount program in java using map reduce framework. Hadoop was used (Hadoop was executed both on CSHELL and dataproc environment).
Map extracted the hrefs using regex. Combiner combined the count for the keys (hrefs) and reducer totalled it.

#	20
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

Comparison
<img width="1674" height="519" alt="Screenshot 2025-09-05 195920" src="https://github.com/user-attachments/assets/7a6b096e-cae0-422f-bf22-9960cf7bfc2d" />

<img width="1105" height="587" alt="Screenshot 2025-09-05 200750" src="https://github.com/user-attachments/assets/0b4c3d1c-561f-4c73-9e74-d922fa6d5082" />
