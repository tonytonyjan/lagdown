module MathjaxHelper
  def mathjax_script_tag *elements
    js_array = elements.empty? ? '[]' : "['#{elements.join("','")}']"
    result = content_tag :script, type: 'text/x-mathjax-config' do
      "MathJax.Hub.Config({elements: #{js_array},tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]}});".html_safe
    end
    result += javascript_include_tag 'mathjax/MathJax.js?config=TeX-AMS-MML_HTMLorMML'
    result
  end
end
