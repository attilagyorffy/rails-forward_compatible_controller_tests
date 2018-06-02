class KwargsController < ActionController::Base
  def test_kwargs
    @params = params.to_unsafe_h.except('controller', 'action')
    @xhr = request.xhr?
    @hello_header = request.headers['HTTP_HELLO'] || request.headers['rack.session']['Hello']
    @flash = flash['flashy']
    render json: { params: @params,
                   xhr: @xhr,
                   hello_header: @hello_header,
                   flash: @flash }
  end
end
