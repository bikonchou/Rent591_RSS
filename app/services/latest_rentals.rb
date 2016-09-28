require 'rest-client'

class LatestRentals

  def initialize
    @subscription = Subscription.last    
  end

  def call
    new_response = JSON.parse(request_latest_rentals)["data"]["data"].first(10)
    new_response_ids = new_response.map { |x| x['id'] }
    last_resonse_ids = @subscription.last_result.present? ? @subscription.last_result.delete('[').delete(']').split(',').map(&:to_i) : []
    @subscription.last_result = new_response_ids
    @subscription.save!

    latest_rentals_ids = new_response_ids - last_resonse_ids
    latest_rentals = new_response.map { |x| x if latest_rentals_ids.include? x['id'] }.compact if latest_rentals_ids.present?

  end

  private

  def request_latest_rentals
    RestClient.get 'https://rent.591.com.tw/home/search/rsList', { Cookie: 'urlJumpIp=3;', params: { is_new_list: 1, type: 1, kind: 0, searchtype: 1, region: 3, section: 43, rentprice: '5000,10000', area: 7, order: 'posttime', orderType: 'desc' } }  
  end

end
