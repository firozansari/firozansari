{{ $blogroll := getJSON "https://blogroll.firozansari.com/blogs/index.json" }}

<ul>
  {{ range $blogroll.data }}
  <li>
    <a href="{{ .url }}">{{ .url }}</a>
  </li>
  {{ end }}
</ul>
