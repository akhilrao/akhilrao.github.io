---
layout: frontpage
title: Memes
description: A collection of memes
---

<style>
.memes-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 20px;
  margin: 20px 0;
}

.meme-item {
  text-align: center;
}

.meme-item img {
  max-width: 100%;
  height: auto;
  border-radius: 8px;
  box-shadow: 0 2px 8px rgba(0,0,0,0.1);
  transition: transform 0.2s ease;
}

.meme-item img:hover {
  transform: scale(1.02);
  cursor: pointer;
}

@media (max-width: 768px) {
  .memes-grid {
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 15px;
  }
}

@media (max-width: 480px) {
  .memes-grid {
    grid-template-columns: 1fr;
    gap: 20px;
  }
}
</style>

<div class="memes-grid">
  {% assign meme_files = site.static_files | where: "path", "/assets/memes" %}
  {% assign meme_images = "" | split: "" %}
  
  {% for file in site.static_files %}
    {% if file.path contains "/assets/memes/" %}
      {% assign file_extension = file.path | split: "." | last | downcase %}
      {% if file_extension == "png" or file_extension == "jpg" or file_extension == "jpeg" or file_extension == "gif" or file_extension == "webp" %}
        {% assign meme_images = meme_images | push: file %}
      {% endif %}
    {% endif %}
  {% endfor %}
  
  {% assign sorted_memes = meme_images | sort: "path" %}
  
  {% for meme in sorted_memes %}
    <div class="meme-item">
      <img src="{{ BASE_PATH }}{{ meme.path }}" alt="{{ meme.basename }}" onclick="window.open(this.src, '_blank')">
    </div>
  {% endfor %}
  
  {% if meme_images.size == 0 %}
    <div style="grid-column: 1 / -1; text-align: center; color: #666; font-style: italic;">
      No memes found. Add image files to the <code>assets/memes/</code> directory.
    </div>
  {% endif %}
</div>