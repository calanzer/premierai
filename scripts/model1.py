import numpy
import pandas
from datetime import datetime
from datetime import date


data = pandas.read_csv("../data/spi_matches.csv")

#Adds new column with the number of days since the game
def addDaysSinceGame(data):
    today = date.today()
    date_format = "%m/%d/%Y"
    data['date'] = pandas.to_datetime(data['date'])
    data['daysSi/nce'] = today - data['date']

#Main function
def main():
    addDaysSinceGame(data)
    print(data)


#Run Main
if __name__ == "__main__":
    main()
