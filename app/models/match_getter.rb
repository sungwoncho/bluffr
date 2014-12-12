class MatchGetter
  attr_accessor :date

  API_KEY = '22b010b0-6e2d-bd23-143ae1773790'
  COMPETITION_ID = 1204 # EPL

  def initialize(date)
    @date = date
  end

  def get_match
    call = '/api'
    action = 'today'

    # Call API and return json body of response
    response = HTTParty.get("http://football-api.com/#{call}/?Action=#{action}&APIKey=#{API_KEY}&comp_id=#{COMPETITION_ID}")
    puts response.body
  end
end