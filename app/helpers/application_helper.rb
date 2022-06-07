module ApplicationHelper
  def render_turbo_stream_flash_messages
    turbo_stream.prepend "flash", partial: "layouts/flash"
  end

  def form_error_notification(object)
    if object.errors.any?
      tag.div class: "error-message" do
        object.errors.full_messages.to_sentence.capitalize
      end
    end
  end

  # 適切なid値を生成する
  # 引数を使ってdom_idで値が生成できるものはその値、dom_idで生成できないものは引数そのままを
  # 使い、"_"で結合した文字列を返す
  # e.x.
  # l = LineItemDate.find(1)
  # nested_dom_id(l, LineItem.new) # => line_item_date_1_new_line_item
  # nested_dom_id(l, "line_items") # => line_item_date_1_line_items
  def nested_dom_id(*args)
    args.map { |arg| arg.respond_to?(:to_key) ? dom_id(arg) : arg }.join("_")
  end
end
