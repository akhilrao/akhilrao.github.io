---
layout: page
title: Research
description: Research by Akhil Rao
active_page: research
---

<style>
/* Research page specific styles */
.research-container {
  display: flex;
  gap: 2rem;
  margin-top: 1rem;
}

.filters-sidebar {
  flex: 0 0 200px;
  background: #f8f9fa;
  padding: 1.5rem;
  border-radius: 8px;
  height: fit-content;
  position: sticky;
  top: 2rem;
}

.papers-content {
  flex: 1;
}

.filter-section {
  margin-bottom: 1.5rem;
}

.filter-section h4 {
  margin-bottom: 0.75rem;
  color: #333;
  font-size: 0.9rem;
  font-weight: 600;
}

.filter-options {
  display: flex;
  flex-direction: column;
  gap: 0.25rem;
}

.filter-options input[type="radio"] {
  margin-right: 0.5rem;
}

.filter-options label {
  font-size: 0.85rem;
  cursor: pointer;
  padding: 0.25rem 0;
}

.paper-item {
  margin-bottom: 2.5rem;
  padding-bottom: 1.5rem;
  border-bottom: 1px solid #eee;
}

.paper-item:last-child {
  border-bottom: none;
}

.paper-title {
  font-size: 1.1rem;
  font-weight: 600;
  color: darkslateblue;
  margin-bottom: 0.5rem;
  line-height: 1.3;
}

.paper-authors {
  color: #666;
  margin-bottom: 0.25rem;
}

.paper-venue {
  font-style: italic;
  color: #777;
  margin-bottom: 1rem;
}

.paper-summary {
  color: #555;
  line-height: 1.5;
  margin-bottom: 1rem;
}

.paper-links {
  margin-bottom: 0.75rem;
}

.paper-link {
  display: inline-block;
  padding: 0.4rem 0.8rem;
  margin-right: 0.5rem;
  margin-bottom: 0.5rem;
  text-decoration: none;
  border-radius: 4px;
  font-size: 0.85rem;
  font-weight: 500;
  transition: all 0.2s ease;
}

.paper-link:hover {
  text-decoration: none;
  transform: translateY(-1px);
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

/* Link type specific colors */
.link-final {
  background-color: #28a745;
  color: white;
}

.link-final:hover {
  background-color: #218838;
  color: white;
}

.link-preprint {
  background-color: #007bff;
  color: white;
}

.link-preprint:hover {
  background-color: #0056b3;
  color: white;
}

.link-abstract {
  background-color: #6f42c1;
  color: white;
}

.link-abstract:hover {
  background-color: #5a32a3;
  color: white;
}

.link-repo {
  background-color: #fd7e14;
  color: white;
}

.link-repo:hover {
  background-color: #e8690b;
  color: white;
}

.paper-tags {
  display: flex;
  flex-wrap: wrap;
  gap: 0.5rem;
}

.tag {
  padding: 0.25rem 0.6rem;
  border-radius: 12px;
  font-size: 0.75rem;
  font-weight: 500;
}

/* Type tags */
.tag-qualitative_theory { background-color: #e1f5fe; color: #01579b; }
.tag-quantitative_theory { background-color: #e8eaf6; color: #1a237e; }
.tag-empirical { background-color: #e8f5e8; color: #388e3c; }
.tag-methodology { background-color: #e0f2f1; color: #00695c; }

/* Domain tags */
.tag-space { background-color: #e8f5e8; color: #388e3c; }
.tag-macroeconomics { background-color: #e8f4fd; color: #0277bd; }

/* Status tags */
.tag-finished { background-color: #ffebee; color: #d32f2f; }
.tag-active { background-color: #f3e5f5; color: #7b1fa2; }
.tag-dormant { background-color: #f5f5f5; color: #616161; }
.tag-cold_storage { background-color: #eceff1; color: #455a64; }

/* Responsive design */
@media (max-width: 768px) {
  .research-container {
    flex-direction: column;
    gap: 1rem;
  }
  
  .filters-sidebar {
    flex: none;
    position: static;
    order: -1;
  }
  
  .filter-options {
    flex-direction: row;
    flex-wrap: wrap;
    gap: 1rem;
  }
}

/* Filter functionality */
.paper-item {
  display: block;
}

.paper-item.hidden {
  display: none;
}

/* Show all papers by default */
input[type="radio"]:checked[value="all"] ~ .papers-list .paper-item,
input[type="radio"]:not(:checked) ~ .papers-list .paper-item {
  display: block;
}

/* Type filters */
input[type="radio"]:checked[value="qualitative_theory"] ~ .papers-list .paper-item:not([data-type="qualitative_theory"]),
input[type="radio"]:checked[value="quantitative_theory"] ~ .papers-list .paper-item:not([data-type="quantitative_theory"]),
input[type="radio"]:checked[value="empirical"] ~ .papers-list .paper-item:not([data-type="empirical"]),
input[type="radio"]:checked[value="methodology"] ~ .papers-list .paper-item:not([data-type="methodology"]) {
  display: none;
}

/* Domain filters */
input[type="radio"]:checked[value="space"] ~ .papers-list .paper-item:not([data-domain="space"]),
input[type="radio"]:checked[value="macroeconomics"] ~ .papers-list .paper-item:not([data-domain="macroeconomics"]) {
  display: none;
}

/* Status filters */
input[type="radio"]:checked[value="finished"] ~ .papers-list .paper-item:not([data-status="finished"]),
input[type="radio"]:checked[value="active"] ~ .papers-list .paper-item:not([data-status="active"]),
input[type="radio"]:checked[value="dormant"] ~ .papers-list .paper-item:not([data-status="dormant"]),
input[type="radio"]:checked[value="cold_storage"] ~ .papers-list .paper-item:not([data-status="cold_storage"]) {
  display: none;
}

/* Combined filters - hide if any filter doesn't match */
.paper-item:not([data-type]) { display: none; }
.paper-item:not([data-domain]) { display: none; }
.paper-item:not([data-status]) { display: none; }

/* Reset show all when all filters are set to 'all' */
input[name="type-filter"][value="all"]:checked ~ input[name="domain-filter"][value="all"]:checked ~ input[name="status-filter"][value="all"]:checked ~ .papers-list .paper-item {
  display: block;
}
</style>

<div class="research-container">
  <div class="filters-sidebar">
    <div class="filter-section">
      <h4>Type</h4>
      <div class="filter-options">
        <label><input type="radio" name="type-filter" value="all" checked> All</label>
        <label><input type="radio" name="type-filter" value="qualitative_theory"> Qualitative Theory</label>
        <label><input type="radio" name="type-filter" value="quantitative_theory"> Quantitative Theory</label>
        <label><input type="radio" name="type-filter" value="empirical"> Empirical</label>
        <label><input type="radio" name="type-filter" value="methodology"> Methodology</label>
      </div>
    </div>

    <div class="filter-section">
      <h4>Domain</h4>
      <div class="filter-options">
        <label><input type="radio" name="domain-filter" value="all" checked> All</label>
        <label><input type="radio" name="domain-filter" value="space"> Space</label>
        <label><input type="radio" name="domain-filter" value="macroeconomics"> Macroeconomics</label>
      </div>
    </div>

    <div class="filter-section">
      <h4>Status</h4>
      <div class="filter-options">
        <label><input type="radio" name="status-filter" value="all" checked> All</label>
        <label><input type="radio" name="status-filter" value="finished"> Finished</label>
        <label><input type="radio" name="status-filter" value="active"> Active</label>
        <label><input type="radio" name="status-filter" value="dormant"> Dormant</label>
        <label><input type="radio" name="status-filter" value="cold_storage"> Cold Storage</label>
      </div>
    </div>
  </div>

  <div class="papers-content">
    <div class="papers-list">
      {% assign sorted_papers = site.data.papers.papers | sort: 'year' | reverse %}
      {% for paper in sorted_papers %}
        <div class="paper-item" 
             data-type="{{ paper.type }}" 
             data-domain="{{ paper.domain }}" 
             data-status="{{ paper.status }}">
          
          <h3 class="paper-title">{{ paper.title }}</h3>
          
          <div class="paper-authors">{{ paper.authors }}</div>
          
          <div class="paper-venue">{{ paper.venue }} ({{ paper.year }})</div>
          
          {% if paper.summary and paper.summary != "" %}
            <div class="paper-summary">{{ paper.summary }}</div>
          {% endif %}
          
          <div class="paper-links">
            {% if paper.final_version and paper.final_version != "" %}
              <a href="{{ paper.final_version }}" class="paper-link link-final" target="_blank">Final Version</a>
            {% endif %}
            
            {% if paper.preprint and paper.preprint != "" %}
              <a href="{{ paper.preprint }}" class="paper-link link-preprint" target="_blank">Preprint</a>
            {% endif %}
            
            {% if paper.abstract and paper.abstract != "" %}
              <a href="{{ paper.abstract }}" class="paper-link link-abstract" target="_blank">Abstract</a>
            {% endif %}
            
            {% if paper.repo and paper.repo != "" %}
              <a href="{{ paper.repo }}" class="paper-link link-repo" target="_blank">Repo</a>
            {% endif %}
          </div>
          
          <div class="paper-tags">
            <span class="tag tag-{{ paper.type }}">
              {% case paper.type %}
                {% when 'qualitative_theory' %}Qualitative theory
                {% when 'quantitative_theory' %}Quantitative theory
                {% when 'empirical' %}Empirical
                {% when 'methodology' %}Methodology
              {% endcase %}
            </span>
            
            <span class="tag tag-{{ paper.domain }}">
              {% case paper.domain %}
                {% when 'space' %}Space
                {% when 'macroeconomics' %}Macroeconomics
              {% endcase %}
            </span>
            
            <span class="tag tag-{{ paper.status }}">
              {% case paper.status %}
                {% when 'finished' %}Finished
                {% when 'active' %}Active
                {% when 'dormant' %}Dormant
                {% when 'cold_storage' %}Cold Storage
              {% endcase %}
            </span>
          </div>
        </div>
      {% endfor %}
    </div>
  </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
  const typeFilters = document.querySelectorAll('input[name="type-filter"]');
  const domainFilters = document.querySelectorAll('input[name="domain-filter"]');
  const statusFilters = document.querySelectorAll('input[name="status-filter"]');
  const papers = document.querySelectorAll('.paper-item');
  
  function filterPapers() {
    const selectedType = document.querySelector('input[name="type-filter"]:checked').value;
    const selectedDomain = document.querySelector('input[name="domain-filter"]:checked').value;
    const selectedStatus = document.querySelector('input[name="status-filter"]:checked').value;
    
    papers.forEach(paper => {
      const paperType = paper.getAttribute('data-type');
      const paperDomain = paper.getAttribute('data-domain');
      const paperStatus = paper.getAttribute('data-status');
      
      const typeMatch = selectedType === 'all' || paperType === selectedType;
      const domainMatch = selectedDomain === 'all' || paperDomain === selectedDomain;
      const statusMatch = selectedStatus === 'all' || paperStatus === selectedStatus;
      
      if (typeMatch && domainMatch && statusMatch) {
        paper.style.display = 'block';
      } else {
        paper.style.display = 'none';
      }
    });
  }
  
  // Add event listeners to all filters
  [...typeFilters, ...domainFilters, ...statusFilters].forEach(filter => {
    filter.addEventListener('change', filterPapers);
  });
});
</script>