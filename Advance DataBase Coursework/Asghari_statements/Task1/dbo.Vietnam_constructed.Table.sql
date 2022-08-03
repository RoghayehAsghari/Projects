USE [Asghari_Task1DB]
GO
/****** Object:  Table [dbo].[Vietnam_constructed]    Script Date: 5/14/2022 11:02:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vietnam_constructed](
	[childid] [varchar](50) NULL,
	[yc] [varchar](50) NULL,
	[round] [varchar](50) NULL,
	[inround] [varchar](50) NULL,
	[panel12345] [varchar](50) NULL,
	[deceased] [varchar](50) NULL,
	[dint] [varchar](50) NULL,
	[commid] [varchar](50) NULL,
	[clustid] [varchar](50) NULL,
	[typesite] [varchar](50) NULL,
	[region] [varchar](50) NULL,
	[childloc] [varchar](50) NULL,
	[chsex] [varchar](50) NULL,
	[chlang] [varchar](50) NULL,
	[chethnic] [varchar](50) NULL,
	[chldrel] [varchar](50) NULL,
	[agemon] [float] NULL,
	[marrcohab] [varchar](50) NULL,
	[marrcohab_age] [varchar](50) NULL,
	[birth] [varchar](50) NULL,
	[birth_age] [varchar](50) NULL,
	[chweight] [varchar](50) NULL,
	[chheight] [varchar](50) NULL,
	[bmi] [varchar](50) NULL,
	[zwfa] [varchar](50) NULL,
	[zhfa] [varchar](50) NULL,
	[zbfa] [varchar](50) NULL,
	[zwfl] [varchar](50) NULL,
	[fwfl] [varchar](50) NULL,
	[fhfa] [varchar](50) NULL,
	[fwfa] [varchar](50) NULL,
	[fbfa] [varchar](50) NULL,
	[underweight] [varchar](50) NULL,
	[stunting] [varchar](50) NULL,
	[thinness] [varchar](50) NULL,
	[bwght] [varchar](50) NULL,
	[bwdoc] [varchar](50) NULL,
	[numante] [varchar](50) NULL,
	[delivery] [varchar](50) NULL,
	[tetanus] [varchar](50) NULL,
	[bcg] [varchar](50) NULL,
	[measles] [varchar](50) NULL,
	[dpt] [varchar](50) NULL,
	[polio] [varchar](50) NULL,
	[hib] [varchar](50) NULL,
	[chmightdie] [varchar](50) NULL,
	[chillness] [varchar](50) NULL,
	[chinjury] [varchar](50) NULL,
	[chhprob] [varchar](50) NULL,
	[chdisability] [varchar](50) NULL,
	[chdisscale] [varchar](50) NULL,
	[chsmoke] [varchar](50) NULL,
	[chalcohol] [varchar](50) NULL,
	[chrephealth1] [varchar](50) NULL,
	[chrephealth2] [varchar](50) NULL,
	[chrephealth3] [varchar](50) NULL,
	[chrephealth4] [varchar](50) NULL,
	[chhrel] [varchar](50) NULL,
	[chhealth] [varchar](50) NULL,
	[cladder] [varchar](50) NULL,
	[hsleep] [varchar](50) NULL,
	[hcare] [varchar](50) NULL,
	[hchore] [varchar](50) NULL,
	[htask] [varchar](50) NULL,
	[hwork] [varchar](50) NULL,
	[hschool] [varchar](50) NULL,
	[hstudy] [varchar](50) NULL,
	[hplay] [varchar](50) NULL,
	[commwork] [varchar](50) NULL,
	[commsch] [varchar](50) NULL,
	[preprim] [varchar](50) NULL,
	[agegr1] [varchar](50) NULL,
	[enrol] [varchar](50) NULL,
	[engrade] [varchar](50) NULL,
	[entype] [varchar](50) NULL,
	[hghgrade] [varchar](50) NULL,
	[timesch] [varchar](50) NULL,
	[levlread] [varchar](50) NULL,
	[levlwrit] [varchar](50) NULL,
	[literate] [varchar](50) NULL,
	[careid] [varchar](50) NULL,
	[caredu] [varchar](50) NULL,
	[carehead] [varchar](50) NULL,
	[careage] [varchar](50) NULL,
	[caresex] [varchar](50) NULL,
	[carerel] [varchar](50) NULL,
	[carecantread] [varchar](50) NULL,
	[careladder] [varchar](50) NULL,
	[careldr4yrs] [varchar](50) NULL,
	[dadid] [varchar](50) NULL,
	[dadedu] [varchar](50) NULL,
	[dadlive] [varchar](50) NULL,
	[dadage] [varchar](50) NULL,
	[dadcantread] [varchar](50) NULL,
	[dadyrdied] [varchar](50) NULL,
	[momid] [varchar](50) NULL,
	[momedu] [varchar](50) NULL,
	[momlive] [varchar](50) NULL,
	[momage] [varchar](50) NULL,
	[momcantread] [varchar](50) NULL,
	[momyrdied] [varchar](50) NULL,
	[headid] [varchar](50) NULL,
	[headedu] [varchar](50) NULL,
	[headage] [varchar](50) NULL,
	[headsex] [varchar](50) NULL,
	[headrel] [varchar](50) NULL,
	[hhsize] [varchar](50) NULL,
	[male05] [varchar](50) NULL,
	[male612] [varchar](50) NULL,
	[male1317] [varchar](50) NULL,
	[male1860] [varchar](50) NULL,
	[male61] [varchar](50) NULL,
	[female05] [varchar](50) NULL,
	[female612] [varchar](50) NULL,
	[female1317] [varchar](50) NULL,
	[female1860] [varchar](50) NULL,
	[female61] [varchar](50) NULL,
	[wi_new] [varchar](50) NULL,
	[hq_new] [varchar](50) NULL,
	[sv_new] [varchar](50) NULL,
	[cd_new] [varchar](50) NULL,
	[drwaterq] [varchar](50) NULL,
	[toiletq] [varchar](50) NULL,
	[elecq_new] [varchar](50) NULL,
	[cookingq_new] [varchar](50) NULL,
	[aniany] [varchar](50) NULL,
	[animilk] [varchar](50) NULL,
	[anidrau] [varchar](50) NULL,
	[anirumi] [varchar](50) NULL,
	[anicowm] [varchar](50) NULL,
	[anicowt] [varchar](50) NULL,
	[anicalv] [varchar](50) NULL,
	[anibufm] [varchar](50) NULL,
	[anibuft] [varchar](50) NULL,
	[anibull] [varchar](50) NULL,
	[anihebu] [varchar](50) NULL,
	[anidonk] [varchar](50) NULL,
	[anishee] [varchar](50) NULL,
	[anigoat] [varchar](50) NULL,
	[anipigs] [varchar](50) NULL,
	[anipoul] [varchar](50) NULL,
	[anirabb] [varchar](50) NULL,
	[anispec] [varchar](50) NULL,
	[aniothr] [varchar](50) NULL,
	[ownlandhse] [varchar](50) NULL,
	[ownhouse] [varchar](50) NULL,
	[molisa06] [varchar](50) NULL,
	[molisa09] [varchar](50) NULL,
	[molisa10] [varchar](50) NULL,
	[molisa11] [varchar](50) NULL,
	[molisa12] [varchar](50) NULL,
	[molisa13] [varchar](50) NULL,
	[molisa14] [varchar](50) NULL,
	[molisa15] [varchar](50) NULL,
	[molisa16] [varchar](50) NULL,
	[credit] [varchar](50) NULL,
	[foodsec] [varchar](50) NULL,
	[shcrime1] [varchar](50) NULL,
	[shcrime2] [varchar](50) NULL,
	[shcrime3] [varchar](50) NULL,
	[shcrime4] [varchar](50) NULL,
	[shcrime5] [varchar](50) NULL,
	[shcrime6] [varchar](50) NULL,
	[shcrime7] [varchar](50) NULL,
	[shcrime8] [varchar](50) NULL,
	[shregul1] [varchar](50) NULL,
	[shregul2] [varchar](50) NULL,
	[shregul3] [varchar](50) NULL,
	[shregul4] [varchar](50) NULL,
	[shregul5] [varchar](50) NULL,
	[shecon1] [varchar](50) NULL,
	[shecon2] [varchar](50) NULL,
	[shecon3] [varchar](50) NULL,
	[shecon4] [varchar](50) NULL,
	[shecon5] [varchar](50) NULL,
	[shecon6] [varchar](50) NULL,
	[shecon7] [varchar](50) NULL,
	[shecon8] [varchar](50) NULL,
	[shecon9] [varchar](50) NULL,
	[shecon10] [varchar](50) NULL,
	[shecon11] [varchar](50) NULL,
	[shecon12] [varchar](50) NULL,
	[shecon13] [varchar](50) NULL,
	[shecon14] [varchar](50) NULL,
	[shenv1] [varchar](50) NULL,
	[shenv2] [varchar](50) NULL,
	[shenv3] [varchar](50) NULL,
	[shenv4] [varchar](50) NULL,
	[shenv5] [varchar](50) NULL,
	[shenv6] [varchar](50) NULL,
	[shenv7] [varchar](50) NULL,
	[shenv8] [varchar](50) NULL,
	[shenv9] [varchar](50) NULL,
	[shhouse1] [varchar](50) NULL,
	[shhouse2] [varchar](50) NULL,
	[shhouse3] [varchar](50) NULL,
	[shfam1] [varchar](50) NULL,
	[shfam2] [varchar](50) NULL,
	[shfam3] [varchar](50) NULL,
	[shfam4] [varchar](50) NULL,
	[shfam5] [varchar](50) NULL,
	[shfam6] [varchar](50) NULL,
	[shfam7] [varchar](50) NULL,
	[shfam8] [varchar](50) NULL,
	[shfam9] [varchar](50) NULL,
	[shfam10] [varchar](50) NULL,
	[shfam11] [varchar](50) NULL,
	[shfam12] [varchar](50) NULL,
	[shfam13] [varchar](50) NULL,
	[shfam14] [varchar](50) NULL,
	[shfam18] [varchar](50) NULL,
	[shother] [varchar](50) NULL,
	[shenv13] [varchar](50) NULL
) ON [PRIMARY]
GO
