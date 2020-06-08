exam<-read.csv("r데이터분석_Data/Data/csv_exam.csv")  
exam
library(dplyr)

#summarise function
exam %>% summarise(mean_math=mean(math))
View(exam)
#mean(math), sd(), IQR(), max,min,sum

#group_by. 그룹별 분류 연산 가능. 
exam %>% 
  group_by(class) %>% 
  summarise(mean_math=mean(math))

exam %>% 
  group_by(class) %>% 
  summarise(mm=mean(math),
            sm=sum(math),
            md=median(math),
            cnt=n()) #그룹에 속하는 멤버를 세는 n() 함수.

#2개 이상 그룹화.
library(ggplot2)
mpg
View(mpg)

mpg %>% 
  group_by(manufacturer,drv) %>% 
  summarise(mc=mean(cty)) #%>% #cty:시내주행 연비.
  #head(10)
  
#mpg 데이터를 회사별로 그룹화, class SUV 추출
#tot=cty와 hwy의 평균값 열 추가.

mpg %>% 
  group_by(manufacturer) %>% 
  filter(class=="suv") %>% 
  mutate(tot=(cty+hwy)/2) %>% 
  summarise(mt=mean(tot)) %>% 
  arrange(desc(mt)) %>% 
  head(5)
#자료해석: 제조사별 SUV의 상위 5개의 평균 연비. 

test1<-data.frame(id=c(1,2,3,4,5),
                  midterm=c(60,80,70,90,55))
test2<-data.frame(id=c(1,2,3,4,5),
                  midterm=c(70,80,40,80,75))
test3<-data.frame(id=c(1,2,3,4,5),
                  final=c(70,80,40,80,75))
total<-left_join(test1,test2,by="id")
total

exam

#left함수. 합치는 함수.
name<-data.frame(class=c(1,2,3,4,5),
           teacher=c("kim","lee","park","choi","Go"))
exam_new<-left_join(exam,name,by='class')
exam_new

#횡단위 합침. bind_rows
test1<-data.frame(id=c(1,2,3,4,5),
                  midterm=c(60,80,70,90,55))
test2<-data.frame(id=c(1,2,3,4,5),
                  final=c(70,80,40,80,75))
ta<-bind_rows(test1,test2)
ta
#cf)열단위 합침. bind_cols

exam %>% filter(english>=80)
exam %>% filter(class==1 & math>=50)
exam %>% filter(class %in% c(1,3,5))
exam %>% 
  select(id,math)

#test 컬럼 추가
#english >=60 => pass, fail
exam %>% 
  mutate(test=ifelse(english>=60, 'Pass',"fail")) %>% 
  arrange(test)

test1
test3
left_join(test1,test3,by='id')

#결측값.missing value
df<-data.frame(sex=c("M","F",NA,"M","F"),
           score=c(5,4,3,5,NA))
df

#결측값 찾아내는 구문. 
is.na(df)
table(is.na(df))
table(is.na(df$sex))
table(is.na(df$score))

#score열의 평균출력- NA 포함시 => NA반환.
mean(df$score)
sum(df$score)

#score가 NA인 데이터만 출력.
df %>% filter(is.na(score))

#score에서 결측치 제거
df_nomiss<- df %>% filter(!is.na(score))
df_nomiss
mean(df_nomiss$score)
sum(df_nomiss$score)

#score, sex 컬럼에서 na가 아닌 데이터만 추출.
df_nomiss<-df %>% filter(!is.na(score) &!is.na(sex))
df_nomiss

#결측치 없는 데이터만 추출(na.omit 사용)
df_nomiss2<-na.omit(df)
df_nomiss2

#na.rm: NA remove. T: True결측값 제외 
mean(df$score, na.rm = T)
sum(df$score, na.rm = T)

exam<-read.csv("r데이터분석_Data/Data/csv_exam.csv")  
exam

#연습. 결측치
#c() c함수-> 벡터화
exam[c(3,8,15), "math"]<-NA
exam

#결측치 때문에 NA 출력
exam %>% summarise(mm=mean(math))
#na.rm=T로 결측치 제외.
exam %>% summarise(mm=mean(math, na.rm=T),
                   sm=sum(math,na.rm=T),
                   med=median(math,na.rm=T))

#
#math열 값이 na이면 55를 대입.
exam$math<-ifelse(is.na(exam$math),55, exam$math )
exam$math
table(exam$math) #value_counts() 비슷함. 

mean(exam$math) #가능해진다. 

# 이상치 색출. outlier 검출
df<-data.frame(sex=c(1,2,1,3,2,1),
               score=c(5,4,3,4,2,6))

table(df$sex) # 1,2외 숫자 찾기 쉬움. table함수
table(df$score)

df$sex<-ifelse(df$sex==3,NA,df$sex)
df$sex
df$score<-ifelse(df$score>5,NA,df$score)
df$score

#NA뺀 연산 작업.
df %>% 
  filter(!is.na(sex) & !is.na(score)) %>%  #na걸러냄 
  group_by(sex) %>% 
  summarise(ms=mean(score))


boxplot(mpg$hwy)
boxplot(mpg$hwy)$stats
mean(mpg$hwy)
median(mpg$hwy)

mpg$hwy<-ifelse(mpg$hwy<12 | mpg$hwy>37, NA, mpg$hwy)
mpg$hwy

table(is.na(mpg$hwy))

#drv를 기준으로 그룹화
#mean_hwy<-hwy의 평균, 결측값은 제외
mpg %>% 
  group_by(drv) %>% 
  summarise(mean_hwy=mean(hwy,na.rm=T))

#배경 출력.나눠서 출력.
ggplot(data=mpg, aes(x=displ, y=hwy))

# 출력방식 설정. geom_point로 위에 dot 표현
ggplot(data=mpg, aes(x=displ, y=hwy))+geom_point()

#각각의 설정. 
ggplot(data=mpg, aes(x=displ, y=hwy))+
  geom_point()+
  xlim(3,6)+
  ylim(10,30)

table(is.na(df$score))

ggplot(data=mpg, aes(x=displ, y=hwy))+
  geom_col()

economics
ggplot(data=economics,aes(x=date,y=unemploy))+geom_line()
          
install.packages("foreign")
library(foreign) #SPSS 파일 로드
library(dplyr) #전처리 관련된 연산.
library(ggplot2) #시각화 관련
library(readxl) #엑셀파일 
#한국 복지 패널. koweps
#https://www.koweps.re.kr:442/

raw_welfare<-read.spss(file="r데이터분석_Data/Data/Koweps_hpc10_2015_beta1.sav", to.data.frame=T)
welfare<-raw_welfare #사본 생성

#항상 str 확인해야한다.
str(welfare)

View(welfare)
dim(welfare)
summary(welfare) #기술 통계치

#데이터의 열의 이름이 마음에 들지 않을경우
welfare<-rename(welfare,
       sex=h10_g3,
       birth=h10_g4,
       marriage=h10_g10,
       religion=h10_g11,
       code_job=h10_eco9,
       income=p1002_8aq1,
       code_region=h10_reg7) #지역코드
View(welfare)
class(welfare$sex)
table(welfare$sex)

#이상치, 결측값 처리
welfare$sex=ifelse(welfare$sex==9,NA,welfare$sex)
#형식 기억해두기. 데이터 전처리하는 방법.

table(is.na(welfare$sex))
str(welfare)

#1=> "male", 2=>"female"
welfare$sex<-ifelse(welfare$sex==1, "male","female")
table(welfare$sex)
qplot(welfare$sex)

class(welfare$income)
summary(welfare$income)
#mean이랑 median이 50정도 차이나는것을 보니, 
#극단적으로 수입이 많은 사람 때문에 생긴 현상같다.
# Min=o으로 나온것도 고려해봐야하고, NA값 처리도 해야한다.
#Max값 또한 엄청 크다. 
qplot(welfare$income)+xlim(0,1000)

#이상치 결측값 처리
ifelse(welfare$income %in% c(0,9999), NA, welfare$income)
table(is.na(welfare$income))


#수입이 0원이 아닌 가구에 성별로 수입의 평균값을 출력.
sex_income<-welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(sex) %>% 
  summarise(mi=mean(income))

#이 데이터 실제 2015년 데이터 

ggplot(data=sex_income,
       aes(x=sex, y=mi))+
  geom_col()


summary(welfare$birth)
table(is.na(welfare$birth))
#결측값 없다.

#9999=>NA
welfare$birth<-ifelse(welfare$birth==9999,NA,welfare$birth)
table(welfare$birth)
welfare$age<-2015-welfare$birth+1
summary(welfare$sa)
qplot(welfare$age)

#나이별(연령별)에 대한 수입 변화.
age_income<-welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(age) %>% 
  summarise(mi=mean(income))

head(age_income)

ggplot(data=age_income,
       aes(x=age, y=mi))+
  geom_line()


welfare<-welfare %>% 
  mutate(ageg = ifelse(age<30,"young",ifelse(age<59,"middle","old")))

ttable(welfare$ageg)
qplot(welfare$ageg)

#연령대별(초년,중년,장년)월 수입
#시각화까지
#연령대별 월수입평균
ageg_income<-welfare %>% 
  group_by(ageg) %>% 
  summarise(am=mean(income,na.rm = T))

welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(ageg) %>% 
  summarise(mi=mean(income))

ageg_income
ggplot(data=ageg_income,aes(x=ageg,y=am))+geom_col()
ggplot(data=ageg_income,aes(x=ageg,y=am))+
  geom_col()+
  scale_x_discrete(limits=c("young","middle","old"))

#성별 연령대별 월급차이는 평균 얼마인가?

sex_income<-welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(ageg,sex) %>% 
  summarise(mi=mean(income))
sex_income

ggplot(data=sex_income, aes(x=ageg, y=mi, fill=sex))+
  geom_col(position = "dodge")
  scale_x_discrete(limits=c("young","middle","old"))

#성별(sex), 연령별(age), 월급 평균표
sex_age<-welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(age, sex) %>%  #sex, age 순서에 따라 달라진다.
  summarise(mi=mean(income))
head(sex_age)

View(sex_age)

#aes함수 
ggplot(data=sex_age, aes(x=age, y=mi,col=sex))+
  geom_line()
#꺽은선에서는 col, 막대그래프에선 fill 옵션 사용.

#직업 코드별 인원수 확인
welfare$code_job
table(welfare$code_job) #table함수로 각각의 갯수 확인.

#2번째 sheet를 열어야 한다.
library(readxl)
list_job<-read_excel("r데이터분석_Data/Data/Koweps_Codebook.xlsx",sheet=2, col_names=T)
list_job

#welfare에다가 code_job join
welfare<-left_join(welfare,list_job, id="code_job")
welfare$job
welfare$code_job

#welfare에서 code_job이 NA가 아닌 데이터에 대해
#code_job, job열을 출력.
welfare %>% 
  filter(!is.na(code_job))%>% 
  select(code_job,job) %>% 
  head(20)

# 직군별 수입
job_income<-welfare %>% 
  filter(!is.na(job) & !is.na(income))%>% 
  group_by(job) %>% 
  summarise(mi=mean(income))
head(job_income)

#상위 10개 직업 추출
top10<-job_income %>% 
  arrange(desc(mi)) %>% # 오름차순 default
  head(10) #상위 10개 직업
top10
#시각화
ggplot(data=top10, aes(x=job, y=mi))+
  geom_col()+
  coord_flip()

#순서 재지정, 많은것부터 나온다.
ggplot(data=top10, aes(x=reorder(job,-mi), y=mi))+
  geom_col()+
  coord_flip()

minor10<-job_income %>% 
  arrange(desc(mi)) %>% 
  tail(10) #하위 10개 직업


#성별에 따라 어떤 직업이 가장 많은지 조사(선호도 조사)
#상위 10개 출력

welfare %>% 
  filter(!is.na(job)) %>% 
  group_by(sex,  job) %>% 
  arrange(desc(job))



