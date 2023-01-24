# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# User.create(email: "admin@stock.com",
#  password: "admin",
#  password_confirmation: "admin",
#  role: User.roles[:admin])
# end

User.create(first_name: 'td', last_name: 'bz', email: 'trader@buzz.com', password: 'password', password_confirmation: 'password', role: 'trader')
User.create(first_name: 'td', last_name: 'bz', email: 'admin@buzz.com', password: 'password', password_confirmation: 'password', role: 'admin')

User.update(email: 'trader@buzz.com', role: 'trader', first_name: 'joe', last_name: 'trader')
User.update(email: 'admin@buzz.com', role: 'admin', first_name: 'jane', last_name: 'admin')

client = IEX::Api::Client.new

amd = client.quote('AMD')
amd_info = client.company('AMD')
Stock.create(symbol: amd.symbol, name: amd_info.company_name, price: amd.latest_price)

tsla = client.quote('TSLA')
tsla_info = client.company('TSLA')
Stock.create(symbol: tsla.symbol, name: tsla_info.company_name, price: tsla.latest_price)

amzn = client.quote('AMZN')
amzn_info = client.company('AMZN')
Stock.create(symbol: amzn.symbol, name: amzn_info.company_name, price: amzn.latest_price)

aapl = client.quote('AAPL')
aapl_info = client.company('AAPL')
Stock.create(symbol: aapl.symbol, name: aapl_info.company_name, price: aapl.latest_price)

nflx = client.quote('NFLX')
nflx_info = client.company('NFLX')
Stock.create(symbol: nflx.symbol, name: nflx_info.company_name, price: nflx.latest_price)

nvda = client.quote('NVDA')
nvda_info = client.company('NVDA')
Stock.create(symbol: nvda.symbol, name: nvda_info.company_name, price: nvda.latest_price)

msft = client.quote('MSFT')
msft_info = client.company('MSFT')
Stock.create(symbol: msft.symbol, name: msft_info.company_name, price: msft.latest_price)

jd = client.quote('JD')
jd_info = client.company('JD')
Stock.create(symbol: jd.symbol, name: jd_info.company_name, price: jd.latest_price)

csco = client.quote('CSCO')
csco_info = client.company('CSCO')
Stock.create(symbol: csco.symbol, name: csco_info.company_name, price: csco.latest_price)

meta = client.quote('META')
meta_info = client.company('META')
Stock.create(symbol: meta.symbol, name: meta_info.company_name, price: meta.latest_price)
