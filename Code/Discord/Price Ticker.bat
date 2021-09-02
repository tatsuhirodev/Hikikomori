from discord.ext import commands
from yahoo_fin import stock_info as si


def read_token():
    with open('botTokenPath.txt', 'r') as f:
        lines = f.readlines()
        return lines[0].strip()

token = read_token()

bot = commands.Bot(command_prefix="!!")

@bot.command()

async def run(ctx):
    while True:
        change = si.get_quote_data("StockSymbol")

        name="S&P500: \n$"+ str(round(si.get_live_price("StockSymbol"),2))+ "("+str(round(change["regularMarketChangePercent"],2))+")"+"%"
        await ctx.guild.me.edit(nick=name)
