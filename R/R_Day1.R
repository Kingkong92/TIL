#R에선 Ctrl+ Enter가 실행.
a<-1 #a에 1 할당 #a <- 1 <=> a = 1
a
b<-2
(a+b)/2

v1<-c(1,2,5,8,9)
v1

v2<-c(1:5)
v2

v3<-seq(1,5)
v3

v4<-seq(1,10,by=3)
v4
v4+1 #벡터화 연산. 

s1<-"a"
s2<-"text"
s3<-"hi"

s4<-c(s1,s2,s3)
s4
s4+1

mean(v1)
max(v1)
min(v1)

s4
paste(s4, collapse=)

install.packages("ggplot2")
library(ggplot2)

x<-c("a","a","b","c")
qplot(x)
#빈도 그래프 

mpg
qplot(data=mpg, x=hwy) 

qplot(data=mpg, x=drv, y=hwy, geom='line')
qplot(data=mpg, x=drv, y=hwy, geom='boxplot()',color=)

?qplot

eng<-c(90,80,60,70)
math<-c(50,10,20,90)

df_mid<-data.frame(eng,math)
df_mid
str(df_mid)

class<-c(1,1,2,2)
df_mid<-data.frame(eng,math,class)
df_mid

mean(df_mid$eng)


data.frame(eng=c(90,80,60,70),
math=c(50,10,20,90),
class=c(1,1,2,2))
df

install.packages("readxl")
library(readxl)
df<-read_excel("r데이터분석_Data/Data/excel_exam.xlsx")
df
df$english

novar_df<-read_excel("C:/R_PARK/r데이터분석_Data/Dataexcel_exam_novar.xlsx")
novar_df

#Head가 없어서 읽을고 col_names=F
novar_df<-read_excel("C:/R_PARK/r데이터분석_Data/Data/excel_exam_novar.xlsx", col_names=F)
novar_df

df<-read.csv("r데이터분석_Data/Data/csv_exam.csv")
df
str(df)

#save file
write.csv(df, file="mydf.csv")

exam<-read.csv("r데이터분석_Data/Data/csv_exam.csv")
head(exam,10)
tail(exam,10)

#표로 바로 연결됨.
View(exam)

#pandas shape이랑 비슷함.
dim(exam)

str(exam)

summary(exam)

str(mpg)

head(mpg)

View(mpg)

#summary = discribe 기술 통계
summary(mpg)

df<-data.frame(v1=c(1,2,1),
           v2=c(2,3,2))

#column 이름 변경할때,
install.packages("dplyr")
library(dplyr)
#?rename
df<-rename(df,var1=v1)
df

df$v_sum<-df$var1+df$v2
df

str(mpg)

#total 컬럼추가= hwy+cty의 평균
mpg$total<-(mpg$hwy+mpg$cty)/2
View(mpg)

summary(mpg$total)

#DataFrame 구조로 변경
as.data.frame(mpg)

str(as.data.frame(mpg))
mpg<-as.data.frame(mpg)
mpg

mpg$test<-ifelse(mpg$total>=20,"pass","fail")
head(mpg,20)

#바로 계산한다. pass, fail 몇개인지.
table(mpg$test)

#시각화
qplot(mpg$test)

#A, B, C
mpg$grade <-ifelse(mpg$total>=30, "A", ifelse(mpg$total>=20,"B","C"))
mpg

table(mpg$grade)
qplot(mpg$grade)

#pipe line 기호, 
#%>%  ~에서, 연산 결과를 통해 이런 느낌.

exam<-read.csv("r데이터분석_Data/Data/csv_exam.csv")  
exam

#exam에서 class 1인것만 추출  
exam %>% filter(class==1) %>% filter(math>=50)
#연산 결과를 계속 안으로 들어가면서 하는거.
#filter(class!=1) 가능

#2반이면서 영어점수가 80점 이상인 데이터
exam %>% filter(class==2) %>% filter(english>=80)

exam %>% filter(class==2 & english>=80)
exam %>% filter(class==2 | english>80) # |: or 

#1,3,5반 추출
exam %>% filter(class==1 | class== 3| class== 5)
exam %>% filter(class %in% c(1,3,5))
#in 연산자 용법 활용.

exam$math
exam %>% select(math)
exam %>% select(math, class)

#math만 빠지고
exam %>% select(-math)
exam %>% select(-math,-class)

#class가 1인 행에 대해 english를 출력
exam %>% filter(class==1 ) %>% select(english)

#R에서 가장 중요한것 ggplot2, %>% 

exam %>% 
  filter(class==1 ) %>% 
  select(english)

#exam에서 id, math추출 앞 부분 6행까지 추출
exam %>% 
  select(id, math) %>% 
  head(6)

#math 기준으로 오름차순 정렬 
exam %>% arrange(math)

#math 기준으로 내림차순 정렬 
exam %>% arrange(desc(math))

#class가 1차 정렬, math 2차정렬
exam %>% arrange(class, math)

exam %>% arrange(class, desc(math))

#파생변수. 새로운 열 추가.
exam %>% 
  mutate(total=math+english+science) %>% 
  head

#test열을 추가.(ifelse)
#science가 60점이상 pass, 미만이면 fail

exam %>% 
  mutate(test=ifelse (science >=60,"pass","fail"))
  head

#total=m+e+s
#total 오름차순 정렬
#상위 10개 출력
exam %>% 
  mutate(total=math+english+science) %>% 
  arrange(total) %>% 
  head(10)
