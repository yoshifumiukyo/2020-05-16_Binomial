############################################################
# R-project                                                #
# Program      : a1-BinomialDistribution.r                 #
# Protocol     :                                           #
# Date         :                                           #
# Last         :                                           #
# Programmer   : yoshifumi ukyo                            #
#                                                          #
############################################################
# [Ver.0000]                                               #
# Memorandom   :                                           #
#                                                          #
############################################################


#----- clean-up working directory 
rm(list = (ls(all = TRUE)))
#----- library assignment 
base_dir <- ""
setwd(base_dir)
set.seed(4989)



d1 <- data.frame(type  = "B(n = 30, p = 0.5)", 
                 event = 0:30, 
                 prob  = dbinom(x = 0:30, size = 30, prob = 0.5)) 

d2 <- data.frame(type  = "B(n = 30, p = 0.8)", 
                 event = 0:30, 
                 prob  = dbinom(x = 0:30, size = 30, prob = 0.8)) 

d <- rbind(d1, d2)

library(ggplot2)
p <- ggplot(data = d, aes(x = event, y = prob))
p <- p + theme_bw() 
p <- p + facet_wrap( ~ type, ncol = 2)
p <- p + geom_bar(stat = "identity", width = 0.1, colour = "black", fill = "black")
p <- p + xlab("Number of event")
p <- p + ylab("Probability")
p <- p + scale_x_continuous(limits = c(-1, 31), breaks = seq(from = 0, to = 30, by = 10))
p <- p + scale_y_continuous(limits = c(0.0, 0.2), breaks = seq(from = 0, to = 0.2, by = 0.05))
p <- p + theme(strip.text = element_text(size = 14, colour = "black"))
p <- p + theme(axis.title = element_text(size = 14, colour = "black"))
p <- p + theme(axis.text = element_text(size = 14, colour = "black"))
ggsave(file = paste0(base_dir, "/output/a1-BinDist.png"), plot = p, dpi = 400, w = 6, h = 4)
# plot(p)



