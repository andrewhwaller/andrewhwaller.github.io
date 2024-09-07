---
# Feel free to add content and custom Front Matter to this file.

title: Presentations
layout: default
---

# Presentations
{% for repo in site.data.repos %}
  {% assign url = "https://slides.lukanpriorities.com/" | append: repo.name %}
- [{{ repo.name }}]({{ url }})
{{ repo.topics.reject("slides") | join: ", " }}
{{ repo.description }}
{% endfor %}

----
{:style="text-align:center"}
