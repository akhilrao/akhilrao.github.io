---
layout: page
title: research
description: Akhil Rao's research
---

<div class="research-container">
  <div class="research-filters">
    <h3>Filter by:</h3>
    
    <div class="filter-group">
      <h4>Type</h4>
      <label><input type="radio" name="type" value="all" checked> All</label>
      <label><input type="radio" name="type" value="qualitative_theory"> Qualitative Theory</label>
      <label><input type="radio" name="type" value="quantitative_theory"> Quantitative Theory</label>
      <label><input type="radio" name="type" value="empirical"> Empirical</label>
      <label><input type="radio" name="type" value="methodology"> Methodology</label>
    </div>
    
    <div class="filter-group">
      <h4>Domain</h4>
      <label><input type="radio" name="domain" value="all" checked> All</label>
      <label><input type="radio" name="domain" value="space"> Space</label>
      <label><input type="radio" name="domain" value="macroeconomics"> Macroeconomics</label>
    </div>
    
    <div class="filter-group">
      <h4>Status</h4>
      <label><input type="radio" name="status" value="all" checked> All</label>
      <label><input type="radio" name="status" value="finished"> Finished</label>
      <label><input type="radio" name="status" value="active"> Active</label>
      <label><input type="radio" name="status" value="dormant"> Dormant</label>
      <label><input type="radio" name="status" value="cold_storage"> Cold Storage</label>
    </div>
  </div>

  <div class="research-papers">
    <p class="research-intro">
      Most of my research articles are available on my <a href="https://arxiv.org/a/rao_a_1.html">arxiv page</a> or my <a href="https://scholar.google.com/citations?user=zYJ2IXQAAAAJ&hl=en">Google Scholar page</a>.
    </p>
    
    {% assign sorted_papers = site.data.papers.papers | sort: 'year' | reverse %}
    
    {% for paper in sorted_papers %}
    <div class="paper-item" 
         data-type="{{ paper.type }}" 
         data-domain="{{ paper.domain }}" 
         data-status="{{ paper.status }}">
      
      <div class="paper-header">
        <h3 class="paper-title">{{ paper.title }}</h3>
        <div class="paper-meta">
          <span class="paper-authors">{{ paper.authors }}</span>
          <span class="paper-venue">{{ paper.venue }}</span>
          <span class="paper-year">({{ paper.year }})</span>
        </div>
      </div>
      
      <p class="paper-summary">{{ paper.summary }}</p>
      
      <div class="paper-links">
        {% if paper.final_version and paper.final_version != "" %}
        <a href="{{ paper.final_version }}" class="paper-link final-version">Final Version</a>
        {% endif %}
        {% if paper.preprint and paper.preprint != "" %}
        <a href="{{ paper.preprint }}" class="paper-link preprint">Preprint</a>
        {% endif %}
      </div>
      
      <div class="paper-tags">
        <span class="tag tag-type">{{ paper.type | replace: "_", " " | capitalize }}</span>
        <span class="tag tag-domain">{{ paper.domain | capitalize }}</span>
        <span class="tag tag-status">{{ paper.status | replace: "_", " " | capitalize }}</span>
      </div>
    </div>
    {% endfor %}
  </div>
</div>

<style>
.research-container {
  display: flex;
  gap: 2rem;
  align-items: flex-start;
}

.research-filters {
  flex: 0 0 250px;
  background: #f8f9fa;
  padding: 1.5rem;
  border-radius: 8px;
  position: sticky;
  top: 2rem;
}

.research-filters h3 {
  margin-top: 0;
  margin-bottom: 1rem;
  font-size: 1.1rem;
}

.filter-group {
  margin-bottom: 1.5rem;
}

.filter-group h4 {
  margin: 0 0 0.5rem 0;
  font-size: 0.9rem;
  font-weight: 600;
  color: #555;
}

.filter-group label {
  display: block;
  margin-bottom: 0.3rem;
  font-size: 0.85rem;
  cursor: pointer;
}

.filter-group input[type="radio"] {
  margin-right: 0.5rem;
}

.research-papers {
  flex: 1;
  min-width: 0;
}

.research-intro {
  margin-bottom: 2rem;
  font-style: italic;
}

.paper-item {
  margin-bottom: 2rem;
  padding-bottom: 1.5rem;
  border-bottom: 1px solid #eee;
}

.paper-item:last-child {
  border-bottom: none;
}

.paper-header {
  margin-bottom: 0.5rem;
}

.paper-title {
  margin: 0 0 0.3rem 0;
  font-size: 1.1rem;
  line-height: 1.3;
}

.paper-meta {
  font-size: 0.9rem;
  color: #666;
}

.paper-authors {
  font-weight: 500;
}

.paper-venue {
  font-style: italic;
}

.paper-year {
  font-weight: 500;
}

.paper-summary {
  margin: 0.75rem 0;
  line-height: 1.5;
  color: #444;
}

.paper-links {
  margin: 0.75rem 0;
}

.paper-link {
  display: inline-block;
  margin-right: 1rem;
  padding: 0.3rem 0.8rem;
  color: white;
  text-decoration: none;
  border-radius: 4px;
  font-size: 0.8rem;
  transition: background-color 0.2s;
}

.paper-link:hover {
  color: white;
}

.paper-link.final-version {
  background: #28a745;
}

.paper-link.final-version:hover {
  background: #1e7e34;
}

.paper-link.preprint {
  background: #007bff;
}

.paper-link.preprint:hover {
  background: #0056b3;
}

.paper-tags {
  margin-top: 0.5rem;
}

.tag {
  display: inline-block;
  padding: 0.2rem 0.5rem;
  margin-right: 0.5rem;
  background: #e9ecef;
  color: #495057;
  border-radius: 12px;
  font-size: 0.7rem;
  font-weight: 500;
}

.tag-type { background: #d1ecf1; color: #0c5460; }
.tag-domain { background: #d4edda; color: #155724; }
.tag-status { background: #f8d7da; color: #721c24; }

/* Hide papers that don't match current filters */
.paper-item {
  display: block;
}

/* CSS-only filtering logic - Fixed structure */
.research-container:has(input[name="type"][value="qualitative_theory"]:checked) .paper-item:not([data-type="qualitative_theory"]),
.research-container:has(input[name="type"][value="quantitative_theory"]:checked) .paper-item:not([data-type="quantitative_theory"]),
.research-container:has(input[name="type"][value="empirical"]:checked) .paper-item:not([data-type="empirical"]),
.research-container:has(input[name="type"][value="methodology"]:checked) .paper-item:not([data-type="methodology"]),
.research-container:has(input[name="domain"][value="space"]:checked) .paper-item:not([data-domain="space"]),
.research-container:has(input[name="domain"][value="macroeconomics"]:checked) .paper-item:not([data-domain="macroeconomics"]),
.research-container:has(input[name="status"][value="finished"]:checked) .paper-item:not([data-status="finished"]),
.research-container:has(input[name="status"][value="active"]:checked) .paper-item:not([data-status="active"]),
.research-container:has(input[name="status"][value="dormant"]:checked) .paper-item:not([data-status="dormant"]),
.research-container:has(input[name="status"][value="cold_storage"]:checked) .paper-item:not([data-status="cold_storage"]) {
  display: none;
}

/* Responsive design */
@media (max-width: 768px) {
  .research-container {
    flex-direction: column;
  }
  
  .research-filters {
    position: static;
    flex: none;
  }
  
  .filter-group {
    margin-bottom: 1rem;
  }
  
  .filter-group label {
    display: inline-block;
    margin-right: 1rem;
    margin-bottom: 0.3rem;
  }
}
</style>

<script>
// JavaScript fallback for browsers that don't support :has() selector
document.addEventListener('DOMContentLoaded', function() {
  const filters = document.querySelectorAll('input[type="radio"]');
  const papers = document.querySelectorAll('.paper-item');
  
  function filterPapers() {
    const typeFilter = document.querySelector('input[name="type"]:checked').value;
    const domainFilter = document.querySelector('input[name="domain"]:checked').value;
    const statusFilter = document.querySelector('input[name="status"]:checked').value;
    
    papers.forEach(paper => {
      const paperType = paper.getAttribute('data-type');
      const paperDomain = paper.getAttribute('data-domain');
      const paperStatus = paper.getAttribute('data-status');
      
      const typeMatch = typeFilter === 'all' || paperType === typeFilter;
      const domainMatch = domainFilter === 'all' || paperDomain === domainFilter;
      const statusMatch = statusFilter === 'all' || paperStatus === statusFilter;
      
      if (typeMatch && domainMatch && statusMatch) {
        paper.style.display = 'block';
      } else {
        paper.style.display = 'none';
      }
    });
  }
  
  filters.forEach(filter => {
    filter.addEventListener('change', filterPapers);
  });
});
</script>