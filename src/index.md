---
# Feel free to add content and custom Front Matter to this file.

layout: default
---

# Slides Index
{% for repo in site.data.repos %}
  {% assign url = "https://slides.lukanpriorities.com/" | append: repo.name %}
- [{{ repo.name }}]({{ url }})
{% endfor %}

----
{:style="text-align:center"}
