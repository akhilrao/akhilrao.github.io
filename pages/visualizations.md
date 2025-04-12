---
layout: page
title: Neat pictures
description: Gallery of neat pictures by Akhil Rao
---

<div class="visualization-filters">
  <h3>Filter by category:</h3>
  <ul class="filter-list">
    <li><a href="#" class="filter-item active" data-category="all">All</a></li>
    
    {% assign categories = site.data.visualizations.visualizations | map: "category" | uniq | sort %}
    {% for category in categories %}
      <li><a href="#" class="filter-item" data-category="{{ category }}">
        {{ category | replace: "_", " " | capitalize }}
      </a></li>
    {% endfor %}
  </ul>
</div>

<div class="visualization-gallery">
  {% for viz in site.data.visualizations.visualizations %}
    <div class="gallery-item" data-category="{{ viz.category }}">
      <a href="{{ BASE_PATH }}/pages/publpics/{{ viz.id }}.html">
        <div class="gallery-title">
          <h3>{{ viz.title }}</h3>
          {% if viz.description %}
            <p class="gallery-description">{{ viz.description }}</p>
          {% endif %}
        </div>
        <div class="image-container">
          <img src="{{ viz.thumbnail }}" alt="{{ viz.alt }}" title="{{ viz.title }}"/>
        </div>
      </a>
    </div>
  {% endfor %}
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
  const filterItems = document.querySelectorAll('.filter-item');
  const galleryItems = document.querySelectorAll('.gallery-item');
  
  filterItems.forEach(item => {
    item.addEventListener('click', function(e) {
      e.preventDefault();
      
      // Update active class
      filterItems.forEach(i => i.classList.remove('active'));
      this.classList.add('active');
      
      const category = this.getAttribute('data-category');
      
      // Filter gallery items
      galleryItems.forEach(galleryItem => {
        if (category === 'all' || galleryItem.getAttribute('data-category') === category) {
          galleryItem.style.display = 'block';
        } else {
          galleryItem.style.display = 'none';
        }
      });
    });
  });
});
</script>