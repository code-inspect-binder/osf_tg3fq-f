# ----------------------------------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------------------------------

# "A personality trait-based network of boredom, spontaneous and deliberate mind-wandering" 
#  Corinna Martarelli, Alex Bertrams, and Wanja Wolff
# Version 27-02-2020

# ----------------------------------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------------------------------

# Global settings
setwd("~/Desktop/Project_SDMWS&SBPS_2019/manuscript/submission Assessment ms ready")

# ----------------------------------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------------------------------
# Confirmatory approach
# ----------------------------------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------------------------------

# ----------------------------------------------------------------------------------------------------------------------
# Load packages
# ----------------------------------------------------------------------------------------------------------------------
library(jmv)
library(lavaan)
library(readr)
library(dplyr)
library(semTools)
# ----------------------------------------------------------------------------------------------------------------------
# Import data
# ----------------------------------------------------------------------------------------------------------------------
# dataset is shared on OSF: data.csv
Data <- read.csv2("/Users/martarelli/Desktop/Project_SDMWS&SBPS_2019/manuscript/submission Assessment ms ready/data.csv",header=T)

# analyses include the wohle German sample (participants where from Switzerland, Germany, and other countries, mainly Austria)
# analyses include US participants (english-speaking sample)
DataAll <- filter(Data, country == "US" |country == "Switzerland" | country == "Germany" | 
                    country == "other")

DataGerman <- filter(Data, sample == "de")

DataUS  <- filter(Data, country == "US")

# ----------------------------------------------------------------------------------------------------------------------
# Distributional properties of the individual items for the German-speaking sample
# ----------------------------------------------------------------------------------------------------------------------
jmv::descriptives(
  data = DataGerman,
  vars = vars(DMW1, DMW2, DMW3, DMW4, SMW1, SMW2, SMW3, SMW4, SBPS1, SBPS2, SBPS3, SBPS4, SBPS5, SBPS6, SBPS7, SBPS8),
  freq = TRUE,
  hist = TRUE,
  violin = TRUE,
  skew = TRUE,
  kurt = TRUE)

# ----------------------------------------------------------------------------------------------------------------------
# Distributional properties of the individual items for the US sample
# ----------------------------------------------------------------------------------------------------------------------
jmv::descriptives(
  data = DataUS,
  vars = vars(DMW1, DMW2, DMW3, DMW4, SMW1, SMW2, SMW3, SMW4, SBPS1, SBPS2, SBPS3, SBPS4, SBPS5, SBPS6, SBPS7, SBPS8),
  freq = TRUE,
  hist = TRUE,
  violin = TRUE,
  skew = TRUE,
  kurt = TRUE)

# ----------------------------------------------------------------------------------------------------------------------
# CFA-two-factorial model: deliberate and spontaneous mind wandering scales for the German-speaking sample
# ----------------------------------------------------------------------------------------------------------------------
MW.model <- 'DMW  =~ DMW1 + DMW2 + DMW3 + DMW4
SMW =~ SMW1 + SMW2 + SMW3 + SMW4
DMW~~SMW'
fit <- cfa(model = MW.model, data = DataGerman)
standardizedSolution(fit)
summary(fit, fit.measures = TRUE)

# composite reliability
sl <- standardizedSolution(fit)
sl <- sl$est.std[sl$op == "=~"]
sl  
re <- 1 - sl^2
re
sum(0.7402710, 0.8123066, 0.5596033, 0.7743407)^2 / (sum(0.7402710, 0.8123066, 0.5596033, 0.7743407)^2 + sum(0.4519989, 0.3401580, 0.6868442, 0.4003965))
sum(0.5801998, 0.5409677, 0.6196719, 0.8269814)^2 / (sum(0.5801998, 0.5409677, 0.6196719, 0.8269814)^2 + sum(0.6633681, 0.7073539, 0.6160068, 0.3161018))

# ----------------------------------------------------------------------------------------------------------------------
# CFA-one-factorial model: deliberate and spontaneous mind wandering scales for the German-speaking sample
# ----------------------------------------------------------------------------------------------------------------------
MW.model <- 'SDMW  =~ DMW1 + DMW2 + DMW3 + DMW4 + SMW1 + SMW2 + SMW3 + SMW4'
fit <- cfa(model = MW.model, data = DataGerman)
parameterEstimates(fit)
standardizedSolution(fit)
summary(fit, fit.measures = TRUE)

# ----------------------------------------------------------------------------------------------------------------------
# CFA-two-factorial model: deliberate and spontaneous mind wandering scales for the US sample
# ----------------------------------------------------------------------------------------------------------------------
MW.model <- 'DMW  =~ DMW1 + DMW2 + DMW3 + DMW4
SMW =~ SMW1 + SMW2 + SMW3 + SMW4
DMW~~SMW'
fit <- cfa(model = MW.model, data = DataUS)
standardizedSolution(fit)
summary(fit, fit.measures = TRUE)

# composite reliability
sl <- standardizedSolution(fit)
sl <- sl$est.std[sl$op == "=~"]
sl  
re <- 1 - sl^2
re
sum(0.8109101, 0.8611124, 0.7070416, 0.8122085)^2 / (sum(0.8109101, 0.8611124, 0.7070416, 0.8122085)^2 + sum(0.3424249, 0.2584854, 0.5000922, 0.3403174))
sum(0.8709769, 0.7349679, 0.4887677, 0.7974383)^2 / (sum(0.8709769, 0.7349679, 0.4887677, 0.7974383)^2 + sum(0.2413992, 0.4598222, 0.7611061, 0.3640921))

# ----------------------------------------------------------------------------------------------------------------------
# CFA-one-factorial model: deliberate and spontaneous mind wandering scales for the US sample
# ----------------------------------------------------------------------------------------------------------------------
MW.model <- 'SDMW  =~ DMW1 + DMW2 + DMW3 + DMW4 + SMW1 + SMW2 + SMW3 + SMW4'
fit <- cfa(model = MW.model, data = DataUS)
parameterEstimates(fit)
standardizedSolution(fit)
summary(fit, fit.measures = TRUE)

# ----------------------------------------------------------------------------------------------------------------------
# CFA-one-factorial model: boredom scale for the German-speaking sample
# ----------------------------------------------------------------------------------------------------------------------
boredom.model <- 'SBPS  =~ SBPS1 + SBPS2 + SBPS3 + SBPS4 + SBPS5 + SBPS6 + SBPS7 + SBPS8'
fit <- cfa(model = boredom.model, data = DataGerman)
parameterEstimates(fit)
standardizedSolution(fit)
summary(fit, fit.measures = TRUE)

# composite reliability
sl <- standardizedSolution(fit)
sl <- sl$est.std[sl$op == "=~"]
sl  
re <- 1 - sl^2
sum(sl)^2 / (sum(sl)^2 + sum(re))

# composite reliability for BFI-6
BFI.model <- 'BFI  =~ BFI1_r + BFI2 + BFI3 + BFI4 + BFI5_r + BFI6_r'
fit <- cfa(model = BFI.model, data = DataGerman)
summary(fit, fit.measures = TRUE)
sl <- standardizedSolution(fit)
sl <- sl$est.std[sl$op == "=~"]
sl  
re <- 1 - sl^2
sum(sl)^2 / (sum(sl)^2 + sum(re))

# ----------------------------------------------------------------------------------------------------------------------
# CFA-one-factorial model: boredom scale for the US sample
# ----------------------------------------------------------------------------------------------------------------------
boredom.model <- 'SBPS  =~ SBPS1 + SBPS2 + SBPS3 + SBPS4 + SBPS5 + SBPS6 + SBPS7 + SBPS8'
fit <- cfa(model = boredom.model, data = DataUS)
parameterEstimates(fit)
standardizedSolution(fit)
summary(fit, fit.measures = TRUE)

# composite reliability
boredom.model <- 'SBPS  =~ SBPS1 + SBPS2 + SBPS3 + SBPS4 + SBPS5 + SBPS6 + SBPS7 + SBPS8'
fit <- cfa(model = boredom.model, data = DataUS)
summary(fit, fit.measures = TRUE)
sl <- standardizedSolution(fit)
sl <- sl$est.std[sl$op == "=~"]
sl  
re <- 1 - sl^2
sum(sl)^2 / (sum(sl)^2 + sum(re))

# ----------------------------------------------------------------------------------------------------------------------
# Measurement invariance for the deliberate and spontaneous mind wandering scales
# ----------------------------------------------------------------------------------------------------------------------
MW.model <- 'DMW  =~ DMW1 + DMW2 + DMW3 + DMW4
SMW =~ SMW1 + SMW2 + SMW3 + SMW4
DMW~~SMW'
fit <- cfa(model = MW.model, data = DataAll)
summary(fit, fit.measures = TRUE)
measurementInvariance(model = MW.model, data = DataAll,
                                        group = "sample", strict = TRUE) 
# ----------------------------------------------------------------------------------------------------------------------
# Measurement invariance for the boredom scale
# ----------------------------------------------------------------------------------------------------------------------
boredom.model <- 'SBPS  =~ SBPS1 + SBPS2 + SBPS3 + SBPS4 + SBPS5 + SBPS6 + SBPS7 + SBPS8'
fit <- cfa(model = boredom.model, data = DataAll)
summary(fit, fit.measures = TRUE)
measurementInvariance(model = boredom.model, data = DataAll,
                      group = "sample", strict = TRUE) 

# ----------------------------------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------------------------------
# Exploratory approach: EGA 
# ----------------------------------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------------------------------

# ----------------------------------------------------------------------------------------------------------------------
# Load packages
# ----------------------------------------------------------------------------------------------------------------------
library(rio)
library(EGAnet)
library(NetworkToolbox)
library(bootnet)
library(lavaan)
library(readr)
library(dplyr)
library(qgraph)
library(psych)
library(CliquePercolation)


# ----------------------------------------------------------------------------------------------------------------------
# Import data
# ----------------------------------------------------------------------------------------------------------------------
Data <- read.csv2("/Users/martarelli/Desktop/Project_SDMWS&SBPS_2019/manuscript/submission Assessment ms ready/data.csv",header=T)

DataAll <- filter(Data, country == "US" |country == "Switzerland" | 
                 country == "Germany" |  country == "other")

DataAll <- select(DataAll, DMW1, DMW2, DMW3, DMW4, SMW1, SMW2, SMW3, SMW4, 
               SBPS1, SBPS2, SBPS3, SBPS4, SBPS5, SBPS6, SBPS7, SBPS8)


DataGerman <- filter(Data, country == "Switzerland" | country == "Germany" | 
                       country == "other")

DataGerman <- select(DataGerman, DMW1, DMW2, DMW3, DMW4, SMW1, SMW2, SMW3, SMW4, 
                     SBPS1, SBPS2, SBPS3, SBPS4, SBPS5, SBPS6, SBPS7, SBPS8, BFI1_r, BFI2, BFI3, BFI4, BFI5_r, BFI6_r)

# ----------------------------------------------------------------------------------------------------------------------
# Run network analyses
# ----------------------------------------------------------------------------------------------------------------------

gr<- list('Deliberate MW'=c(1:4), 'Spontaneous MW'=c(5:8), 'Boredom'=c(9:16))
names<-c("I allow my thoughts to wander on purpose", "I enjoy mind-wandering", "I find mind-wandering is a good way to cope with boredom", 
         "I allow myself to get absorbed in pleasant fantasy", "I find my thoughts wandering spontaneously", "When I mind-wander my thoughts tend to be pulled from topic to topic", 
         "It feels like I don’t have control over when my mind wanders", "I mind wander even when I’m supposed to be doing something else", 
         "I often find myself at “loose ends,” not knowing what to do", "I find it hard to entertain myself", "Many things I have to do are repetitive and monotonous", 
         "It takes more stimulation to get me going than most people", "I don’t feel motivated by most things that I do", 
         "In most situations, it is hard for me to find something to do or see to keep me interested", "Much of the time, I just sit around doing nothing", "Unless I am doing something exciting, even dangerous, I feel half-dead and dull")

# Network analysis using EBICglasso
n1<-estimateNetwork(DataAll, default= "EBICglasso")
plot(n1, groups = gr, nodeNames = names, legend.cex=.35)
centrality_auto(n1, weighted = TRUE, signed = TRUE)
centralityPlot(n1, include =c("Betweenness","Closeness", "Strength"))
print(n1)

# Network based on correlations
n1a<-estimateNetwork(DataAll, default= "cor")
plot(n1a, groups = gr, legend.cex=.35)

# Network based on partial correlations
n1b<-estimateNetwork(DataAll, default= "pcor")
plot(n1b, groups = gr, legend.cex=.35)

# Clique percolation approach
W <- qgraph(n1$graph)
thresholds <- cpThreshold(W, method = "weighted", k.range = 3,       
                          I.range = c(seq(0.20, 0.01, by = -0.01)), 
                          threshold = c("largest.components.ratio","chi")); thresholds

results <- cpAlgorithm(W, k = 3, method = "weighted", I = 0.15)
cpColoredGraph(W, list.of.communities = results$list.of.communities.numbers, layout = "spring", theme="colorblind")

# Network analysis using EBICglasso with the German-speaking sample including the open-mindedness scale
gr2<- list('Deliberate MW'=c(1:4), 'Spontaneous MW'=c(5:8), 'Boredom'=c(9:16), 'Open-Mindedness'=c(17:22))
names2<-c("I allow my thoughts to wander on purpose", "I enjoy mind-wandering", "I find mind-wandering is a good way to cope with boredom", 
         "I allow myself to get absorbed in pleasant fantasy", "I find my thoughts wandering spontaneously", "When I mind-wander my thoughts tend to be pulled from topic to topic", 
         "It feels like I don’t have control over when my mind wanders", "I mind wander even when I’m supposed to be doing something else", 
         "I often find myself at “loose ends,” not knowing what to do", "I find it hard to entertain myself", "Many things I have to do are repetitive and monotonous", 
         "It takes more stimulation to get me going than most people", "I don’t feel motivated by most things that I do", 
         "In most situations, it is hard for me to find something to do or see to keep me interested", "Much of the time, I just sit around doing nothing", "Unless I am doing something exciting, even dangerous, I feel half-dead and dull",
         "Has few artistic interests", "Is complex, a deep thinker", "Is original, comes up with new ideas",
         "Is fascinated by art, music, or literature", "Has little interest in abstract ideas", "Has little creativity")

n2<-estimateNetwork(DataGerman, default= "EBICglasso")
plot(n2, groups = gr2, nodeNames = names2, legend.cex=.35)
centrality_auto(n2, weighted = TRUE, signed = TRUE)
centralityPlot(n2, include =c("Betweenness","Closeness", "Strength"))
print(n2)

