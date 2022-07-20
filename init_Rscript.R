# ***************
# nazev projektu 
# ***************
# 
# 
# 
# poznamky k projektu




# PACKAGES ----------------------------------------------------------------


# install.packages("tidyverse", dependencies = T)
require(tidyverse)




# BASE  -------------------------------------------------------------------


path_in <- "D:/___EPICIIASA_CZ___/R/" # UPRAVIT
path_out<- "D:/___EPICIIASA_CZ___/R/" # UPRAVIT

promenna1 <- "" # UPRAVIT
promenna2 <- "" # UPRAVIT
promenna3 <- "" # UPRAVIT




# LOAD --------------------------------------------------------------------



# *** READ *** READ *** READ ** READ ***
df1 <- read.table(paste0(path_in, "cultivars/", crop, "_cultivars.csv"), header = TRUE, sep = ",", dec = ",") # UPRAVIT
# *** READ *** READ *** READ ** READ ***


# *** WR *** WR *** WR ** WR ***
write.table(df1, file = paste0(path_out, crop, "/epic_inputs/WHE_crop_cal.csv"), row.names=FALSE, sep = ";") # UPRAVIT
# *** WR *** WR *** WR ** WR ***


# FUC (frequently used commands :D) ---------------------------------------


ggplot(df1, aes(depth, penres, fill=var))+
  geom_bar(stat="identity", color="black", position = position_dodge())+
  geom_errorbar(aes(ymin=penres-sd, ymax=penres+sd), width=.2,
                position=position_dodge(.9))+
  scale_fill_brewer(palette = "Greys", breaks = rev(levels(df1$var)))+
  coord_flip()+
  facet_grid(. ~ year)+
  labs(y = "\nPenetration Resistance [MPa]", x = "Depth [cm]", fill = "", title = "")+
  theme_classic(base_size = 15)+
  theme(text=element_text(family="Times New Roman"))
ggsave("plots/kra_pr.png", device = "png", width = 8, height = 4, dpi = 300)

ggsave(paste0(path_out, index, "_line.png"), device = "png", width = 10, height = 6, dpi = 300)


labs(y = expression("Saturated Hydraulic Conductivity [ mm"~ h^-1~"]"), 
       x = "", title = "", fill = "")+
  theme_classic(base_size = 15)+
  theme(text=element_text(family="Times New Roman"), axis.text.x = element_text(angle = 90, hjust = 0),
        legend.position = "none")

