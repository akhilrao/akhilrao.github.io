---
layout: page
title: Research
description: Research papers by Akhil Rao
active_page: research
---

<link rel="stylesheet" href="{{ BASE_PATH }}/assets/themes/twitter/css/research-timeline.css">

<div style="text-align: center; margin-bottom: 2rem;">
  Most of my research articles are available on my <a href="https://arxiv.org/search/?searchtype=author&query=Rao%2C+A" style="color: #007bff;">arxiv page</a>
  or my <a href="https://scholar.google.com/citations?user=zYJ2IXQAAAAJ&hl=en" style="color: #007bff;">Google Scholar page</a>.
</div>

<div class="research-container">
  <div class="research-filters">
    <h3 style="color: #6f42c1; margin-bottom: 1rem;">Filter by:</h3>
    
    <div class="filter-section" style="margin-bottom: 1.5rem;">
      <h4 style="margin-bottom: 0.5rem;">Type</h4>
      <div style="margin-left: 1rem;">
        <div class="filter-legend">
          <label class="filter-text">
            <input type="radio" name="type" value="all" class="filter-item" checked> All
          </label>
        </div>
        <div class="filter-legend">
          <label class="filter-text">
            <input type="radio" name="type" value="qualitative-theory" class="filter-item"> Qualitative Theory
          </label>
          <span class="legend-symbol symbol-qualitative"></span>
        </div>
        <div class="filter-legend">
          <label class="filter-text">
            <input type="radio" name="type" value="quantitative-theory" class="filter-item"> Quantitative Theory
          </label>
          <span class="legend-symbol symbol-quantitative"></span>
        </div>
        <div class="filter-legend">
          <label class="filter-text">
            <input type="radio" name="type" value="empirical" class="filter-item"> Empirical
          </label>
          <span class="legend-symbol symbol-empirical"></span>
        </div>
        <div class="filter-legend">
          <label class="filter-text">
            <input type="radio" name="type" value="methodology" class="filter-item"> Methodology
          </label>
          <span class="legend-symbol symbol-methodology"></span>
        </div>
      </div>
    </div>

    <div class="filter-section" style="margin-bottom: 1.5rem;">
      <h4 style="margin-bottom: 0.5rem;">Domain</h4>
      <div style="margin-left: 1rem;">
        <div class="filter-legend">
          <label class="filter-text">
            <input type="radio" name="domain" value="all" class="filter-item" checked> All
          </label>
        </div>
        <div class="filter-legend">
          <label class="filter-text">
            <input type="radio" name="domain" value="space" class="filter-item"> Space
          </label>
          <span class="legend-symbol symbol-space">●</span>
        </div>
        <div class="filter-legend">
          <label class="filter-text">
            <input type="radio" name="domain" value="macroeconomics" class="filter-item"> Macroeconomics
          </label>
          <span class="legend-symbol symbol-macro">●</span>
        </div>
        <div class="filter-legend">
          <label class="filter-text">
            <input type="radio" name="domain" value="game-theory" class="filter-item"> Game Theory
          </label>
          <span class="legend-symbol symbol-game">●</span>
        </div>
      </div>
    </div>

    <div class="filter-section">
      <h4 style="margin-bottom: 0.5rem;">Status</h4>
      <div style="margin-left: 1rem;">
        <div class="filter-legend">
          <label class="filter-text">
            <input type="radio" name="status" value="all" class="filter-item" checked> All
          </label>
        </div>
        <div class="filter-legend">
          <label class="filter-text">
            <input type="radio" name="status" value="finished" class="filter-item"> Finished
          </label>
          <div class="legend-symbol symbol-finished"></div>
        </div>
        <div class="filter-legend">
          <label class="filter-text">
            <input type="radio" name="status" value="active" class="filter-item"> Active
          </label>
          <div class="legend-symbol symbol-active"></div>
        </div>
        <div class="filter-legend">
          <label class="filter-text">
            <input type="radio" name="status" value="dormant" class="filter-item"> Dormant
          </label>
          <div class="legend-symbol symbol-dormant"></div>
        </div>
        <div class="filter-legend">
          <label class="filter-text">
            <input type="radio" name="status" value="cold-storage" class="filter-item"> Cold Storage
          </label>
          <div class="legend-symbol symbol-cold"></div>
        </div>
      </div>
    </div>
  </div>

  <div class="research-content">
    <div class="research-list">
      {% for paper in site.data.papers.papers %}
        <div class="research-item" 
             data-type="{{ paper.type | replace: '_', '-' }}" 
             data-domain="{{ paper.domain | replace: ' ', '-' | downcase }}" 
             data-status="{{ paper.status | replace: '_', '-' }}"
             style="margin-bottom: 2rem; padding-bottom: 1.5rem; border-bottom: 1px solid #eee;">
          
          <h3 style="color: #6f42c1; margin-bottom: 0.5rem;">
            <a href="{% if paper.external_link %}{{ paper.external_link }}{% elsif paper.pdf_link %}{{ BASE_PATH }}/{{ paper.pdf_link }}{% else %}#{% endif %}" 
               style="text-decoration: none; color: inherit;">
              {{ paper.title }}
            </a>
          </h3>
          
          <p style="margin: 0.5rem 0; font-style: italic; color: #666;">
            {{ paper.authors }} 
            <em>{{ paper.venue }}</em> ({{ paper.year }})
          </p>
          
          <div style="margin: 0.75rem 0;">
            {% if paper.pdf_link %}
              <a href="{{ BASE_PATH }}/{{ paper.pdf_link }}" class="btn btn-sm" 
                 style="background: #28a745; color: white; text-decoration: none; padding: 4px 12px; border-radius: 4px; font-size: 0.85rem; margin-right: 0.5rem;">
                Final Version
              </a>
            {% endif %}
            {% if paper.external_link %}
              <a href="{{ paper.external_link }}" class="btn btn-sm" 
                 style="background: #007bff; color: white; text-decoration: none; padding: 4px 12px; border-radius: 4px; font-size: 0.85rem; margin-right: 0.5rem;">
                Preprint
              </a>
            {% endif %}
          </div>
          
          <div style="margin: 0.75rem 0;">
            <span class="tag" style="background: #e9f4ff; color: #0066cc; padding: 3px 8px; border-radius: 3px; font-size: 0.8rem; margin-right: 0.5rem;">
              {{ paper.type | replace: '_', ' ' | capitalize }}
            </span>
            <span class="tag" style="background: #f0f9f0; color: #006600; padding: 3px 8px; border-radius: 3px; font-size: 0.8rem; margin-right: 0.5rem;">
              {{ paper.domain | capitalize }}
            </span>
            <span class="tag" style="background: #fff2e6; color: #cc6600; padding: 3px 8px; border-radius: 3px; font-size: 0.8rem;">
              {{ paper.status | replace: '_', ' ' | capitalize }}
            </span>
          </div>
          
          {% if paper.summary %}
            <p style="margin-top: 1rem; color: #555;">{{ paper.summary }}</p>
          {% endif %}
        </div>
      {% endfor %}
    </div>
  </div>

  <div class="research-timeline">
    <h4 style="color: #6f42c1; margin-bottom: 1rem; text-align: center;">Timeline</h4>
    <div class="timeline-container">
      <!-- Timeline will be generated by JavaScript -->
    </div>
  </div>
</div>

<script>
// Embed papers data for JavaScript
window.papersData = [
  {% for paper in site.data.papers.papers %}
  {
    id: "{{ paper.title | slugify }}",
    title: "{{ paper.title | escape }}",
    authors: "{{ paper.authors | escape }}",
    venue: "{{ paper.venue | escape }}",
    year: {{ paper.year }},
    type: "{{ paper.type }}",
    domain: "{{ paper.domain }}",
    status: "{{ paper.status }}",
    pdf_link: "{% if paper.pdf_link %}{{ BASE_PATH }}/{{ paper.pdf_link }}{% endif %}",
    external_link: "{{ paper.external_link }}"
  }{% unless forloop.last %},{% endunless %}
  {% endfor %}
];
</script>

<script src="{{ BASE_PATH }}/research-timeline.js"></script>

<script>
// Enhanced filter functionality for the research list
document.addEventListener('DOMContentLoaded', function() {
  const filterItems = document.querySelectorAll('.filter-item');
  const researchItems = document.querySelectorAll('.research-item');
  
  filterItems.forEach(item => {
    item.addEventListener('change', function() {
      updateResearchFilter();
    });
  });
  
  function updateResearchFilter() {
    const typeFilter = document.querySelector('input[name="type"]:checked');
    const domainFilter = document.querySelector('input[name="domain"]:checked');
    const statusFilter = document.querySelector('input[name="status"]:checked');
    
    const selectedType = typeFilter ? typeFilter.value : 'all';
    const selectedDomain = domainFilter ? domainFilter.value : 'all';
    const selectedStatus = statusFilter ? statusFilter.value : 'all';
    
    researchItems.forEach(item => {
      const itemType = item.dataset.type;
      const itemDomain = item.dataset.domain;
      const itemStatus = item.dataset.status;
      
      let shouldShow = true;
      
      if (selectedType !== 'all' && itemType !== selectedType) {
        shouldShow = false;
      }
      
      if (selectedDomain !== 'all' && itemDomain !== selectedDomain) {
        shouldShow = false;
      }
      
      if (selectedStatus !== 'all' && itemStatus !== selectedStatus) {
        shouldShow = false;
      }
      
      if (shouldShow) {
        item.style.display = 'block';
      } else {
        item.style.display = 'none';
      }
    });
  }
});
</script>