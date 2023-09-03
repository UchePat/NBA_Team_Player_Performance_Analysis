# Analyzing NBA data and Comparing performance of various NBA players and Teams in a season

# install.packages("BasketballAnalyzeR")
library(BasketballAnalyzeR)

#---> Analyzing Performance of NBA Teams in 2017/2018 season
# Data
Tbox

str(Tbox)

data <- data.frame(Tbox[,c(1, 4, 9, 12, 15, 16)])  # these are d columns we are analyzing
data

# renaming the columns to be used in d charts as labels
labs <- c("% 2-point shots made",   # for P2p column
          "% 3-point shots made",   # for P3p column
          "% free throws made",    # for FTp column
          'Points')              # for PTS column

# Create d chart using selected columns
bubbleplot(data, id="Team", 
           x="P2p", 
           y="P3p", 
           col="FTp",
           size = 'PTS',
           labels=labs)
# The x-axis horizontal line/values and y-axis vertical line/values are averages
# We can see that the Golden State Warriors had a great season with highest points and free throws while the Phoenix Suns had a poor season

#---------

# Further Analysis ind Team performance
str(Tbox)

data <- data.frame(Tbox[,c(1, 9, 12, 15)],
                   APS = Tbox$AST / (Tbox$P2A + Tbox$P3A + Tbox$FTA))  # APS is a new column which means Assists per Shot attempt
data

# renaming the columns to be used in d charts as labels
labs <- c("% 2-point shots made",   # for P2p column
          "% 3-point shots made",   # for P3p column
          "% free throws made",    # for FTp column
          'Assists per Shot attempt')      # for APS column

# Create d chart using selected columns
bubbleplot(data, id="Team", 
           x="P2p", 
           y="P3p", 
           col="FTp",
           size = 'APS',
           labels=labs,
           text.size = 4)
# The x-axis horizontal line/values and y-axis vertical line/values are average values
# We can see that the Golden State Warriors has d biggest Assists per Shot attempt while the Phoenix Suns has one of d smallest



#---> Analyzing Performance of NBA Players in 2017/2018 season

# 1: Comparing Players from a single Team
# Data
Pbox

str(Pbox)

data <- Pbox

# Analysing only a subset of d data. using subset() or filter()
data <- subset(Pbox, Team =="Boston Celtics" & MIN >= 500)  # Analysing Players that played a min of 500mins in Boston Celtics only in d season
data

data <- data.frame(data[, c(1, 2, 5, 8, 11, 14)])

# renaming the columns to be used in d charts as labels
labs <- c("% 2-point shots made",
          "% 3-point shots made",
          "% free throws made",
          "Points")

# Create d chart using selected columns
bubbleplot(data, id="Player", 
           x="P2p", 
           y="P3p", 
           col="FTp",
           size="PTS",
           labels=labs)           
# We can see that Kyrie Irving had a great season with highest points and free throws



# 2: Comparing Players from 2 diff Teams
str(Pbox)

data <- Pbox

# Analysing only a subset of d data. using subset() or filter()
data <- subset(Pbox, Team =="Boston Celtics" | Team =="Golden State Warriors" & MIN >= 500)  # Analysing Players that played a min of 500mins in Boston Celtics and Golden State Warriors only in d season
data
View(data)

data <- data.frame(data[, c(1, 2, 5, 8, 11, 14)])

# renaming the columns to be used in d charts as labels
labs <- c("% 2-point shots made",
          "% 3-point shots made",
          "% free throws made",
          "Points")

# Create d chart using selected columns
bubbleplot(data, id="Player", 
           x="P2p", 
           y="P3p", 
           col="FTp",
           size="PTS",
           labels=labs,
           text.col = 'Team',   # creates legend to differentiate d team players based on Team column
           text.size = 3)           
# We can see which team made bigger points and free throws.  