## heatmaps
library(HDMEATools)
library(viridis)
library(patchwork)
setwd("/Users/chloe/Documents/cytoD data")
giant_cytoD_data <- read.csv("giantdf_cytoD.csv", header=T)

#make things more general
slice <- "5" #write selected slice here

#have a closer look .
look4 <- giant_cytoD_data %>%
  filter(Layer =="IV") %>%
  filter(n==slice)
# Assuming your data frame is named df
new_df <- look4 %>%
  group_by(Channels) %>%
  summarize(Subtracted_Frequency = Frequency[Condition == "Control"] - Frequency[Condition == "CytoD"])
#perform functions to subtract freq for grid...
test5<- channel_to_index(new_df) #function2

#using ggplot2:: geom_tile()
graph4<-ggplot(test5, aes(x=col.idx, y=row.idx, fill= Subtracted_Frequency)) +
  geom_tile()+
  ggtitle("Layer IV C2 Control - CytoD")+
  scale_fill_viridis(discrete=FALSE, limits = c(-0.5, 0.5)) +
  theme_bw()+
  theme(plot.title=element_text(hjust=0.5))+
  coord_cartesian(xlim = c(0, 64), ylim = c(64, 0))

graph4

#### layer II//III ####

#have a closer look .
look23 <- giant_cytoD_data %>%
  filter(Layer =="II/III") %>%
  filter(n==slice)
# Assuming your data frame is named df
new_df <- look23 %>%
  group_by(Channels) %>%
  summarize(Subtracted_Frequency = Frequency[Condition == "Control"] - Frequency[Condition == "CytoD"])
#perform functions to subtract freq for grid...
test5<- channel_to_index(new_df) #function2

#using ggplot2:: geom_tile()
graph23<-ggplot(test5, aes(x=col.idx, y=row.idx, fill= Subtracted_Frequency)) +
  geom_tile()+
  ggtitle("Layer II/III C2 Control - CytoD")+
  scale_fill_viridis(discrete=FALSE, limits = c(-0.5, 0.5)) +
  theme_bw()+
  theme(plot.title=element_text(hjust=0.5))+
  coord_cartesian(xlim = c(0, 64), ylim = c(64, 0))

graph23

#have a closer look .
look1 <- giant_cytoD_data %>%
  filter(Layer =="I") %>%
  filter(n==slice)
# Assuming your data frame is named df
new_df <- look1 %>%
  group_by(Channels) %>%
  summarize(Subtracted_Frequency = Frequency[Condition == "Control"] - Frequency[Condition == "CytoD"])
#perform functions to subtract freq for grid...
test5<- channel_to_index(new_df) #function2

#using ggplot2:: geom_tile()
graph1<-ggplot(test5, aes(x=col.idx, y=row.idx, fill= Subtracted_Frequency)) +
  geom_tile()+
  ggtitle("Layer I C2 Control - CytoD")+
  scale_fill_viridis(discrete=FALSE, limits = c(-0.5, 0.5)) +
  theme_bw()+
  theme(plot.title=element_text(hjust=0.5))+
  coord_cartesian(xlim = c(0, 64), ylim = c(64, 0))

graph1

# merge
graph4 + graph23 + graph1+
plot_layout(guides = "collect")

