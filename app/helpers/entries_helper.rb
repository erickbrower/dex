module EntriesHelper
  def markdown_render(content)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, 
                                       :autolink => true, 
                                       :space_after_headers => true)
    markdown.render(content).html_safe
  end

  def source_code_render(content, etype)
    CodeRay.scan(content, etype).div
  end
end
