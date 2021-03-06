module DeviseHelper

  def devise_error_messages!
    flash_alerts = []
    error_key = 'errors.messages.not_saved'

    if !flash.empty?
      flash_alerts.push(flash[:error]) if flash[:error]
      flash_alerts.push(flash[:alert]) if flash[:alert]
      error_key = 'devise.failure.invalid'
    end

    return "" if resource.errors.empty? && flash_alerts.empty?
    errors = resource.errors.empty? ? flash_alerts : resource.errors.full_messages

    messages = errors.map { |msg| content_tag(:li, msg) }.join

    html = <<-HTML
      <div class="alert alert-danger">
        <ul>
          <li class="ng-binding ng-scope">
          #{messages}
          </li>
        </ul>
      </div>
    HTML

    html.html_safe
  end

end
