module MathjaxHelper  
  def mathjax_script_tag
    result = content_tag :script, type: 'text/x-mathjax-config' do
      "MathJax.Hub.Config({tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]}});".html_safe
    end
    result += javascript_include_tag 'mathjax/MathJax.js?config=TeX-AMS-MML_HTMLorMML'
    result
  end
end
