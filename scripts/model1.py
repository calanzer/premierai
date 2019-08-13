import numpy
import pandas
from datetime import datetime
from datetime import date


data = pandas.read_csv("../data/spi_matches.csv")

#Takes two parameters, name and the path of the file you want to query. Returns a dataframe with the players stats.
def getPlayerRating(name, filepath):
    fifadata = pandas.read_csv(filepath)
    result = fifadata[fifadata['NAME'].str.contains(name)]
    if len(result) > 0:
        result = result.nsmallest(1, 'RATING')
    #print(result)
    print(result['RATING'].values.tolist())





#Adds new column with the number of days since the game
def addDaysSinceGame(data):
    today = date.today()
    date_format = "%m/%d/%Y"
    data['date'] = pandas.to_datetime(data['date'])
    data['daysSince'] = today - data['date']

#Main function
def main():
    getPlayerRating('Antonio Valencia', '../data/FIFA11.csv')
    #addDaysSinceGame(data)



#Run Main
if __name__ == "__main__":
    main()
