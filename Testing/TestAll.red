korder x,y,z,w;
in "Primgcd.red";
in "Subresgcd.red";
in "HearnBasic.red";
in "HearnFull.red";
in "JHD.red";
in "../Tests/PrimgcdTests.red";
in "../Tests/SubresgcdTests.red";
in "../Tests/HearnBasicTests.red";
in "../Tests/HearnFullTests.red";
in "../Tests/JHDTests.red";
Write "Marks:",{ PrimMarks, SubresMarks, HearnBasicMarks, HearnFullMarks, JHDMarks,
PrimMarks+ SubresMarks+ HearnBasicMarks+ HearnFullMarks+ JHDMarks};
;end;
