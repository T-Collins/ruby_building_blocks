#Find the highest selling point as a reference (can't sell on the first day)
#Find the lowest buying point (can't buy on the last day). Consider all values to the right of this value to find the highest selling point
#The only way more profit can be made is if there is a larger selling point to the left of the lowest buying point
#so we no longer need to consider selling points to the right of the lowest buying point, hence we can split the array here
#and take values only to the left. With these values to the left, call the method recursively (find new lowest buying point, new highest
#selling point etc) until we are selling at the highest selling point of the whole array, best profit is found at this point

#start off with a best_profit that is the minimum integer, so the first run through of stock_picker will override this

def stock_picker(prices, best_profit = -(2**(0.size * 8 -2)) )
	min_buy_index = 0
	max_sell_index = 0
	
	abs_max_sell = prices[1..-1].max

	min_buy = prices[0..-2].min
	min_buy_index = prices.index(min_buy)

	max_sell = prices[(min_buy_index+1)..-1].max
	max_sell_index = (min_buy_index + 1) + prices[(min_buy_index+1)..-1].index(max_sell)

	profit = max_sell - min_buy
	
	if (profit > best_profit)
		best_profit = profit
	end
	if (max_sell == abs_max_sell || prices[0..(min_buy_index-1)].length == 1)
		puts "Best profit is #{best_profit}, buying on day #{min_buy_index} and selling on day #{max_sell_index}"
	else
		prices = prices[0..(min_buy_index-1)]
		stock_picker(prices, best_profit)
	end
end

stock_picker([17,3,6,9,15,8,6,1,10])

