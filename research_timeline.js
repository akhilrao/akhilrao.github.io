// Research Timeline Functionality
document.addEventListener('DOMContentLoaded', function() {
  // Parse papers data from the page
  const papers = window.papersData || []; // Will be populated by the research page
  
  // Initialize timeline
  initializeTimeline();
  
  // Set up filter interactions
  initializeFilters();
  
  function initializeTimeline() {
    const timelineContainer = document.querySelector('.timeline-container');
    if (!timelineContainer || !window.papersData) return;
    
    // Group papers by year
    const papersByYear = {};
    window.papersData.forEach(paper => {
      const year = paper.year;
      if (!papersByYear[year]) {
        papersByYear[year] = [];
      }
      papersByYear[year].push(paper);
    });
    
    // Sort years
    const years = Object.keys(papersByYear).sort((a, b) => b - a); // Newest first
    
    // Create timeline line
    const timelineLine = document.createElement('div');
    timelineLine.className = 'timeline-line';
    timelineContainer.appendChild(timelineLine);
    
    // Create year sections
    years.forEach(year => {
      const yearSection = createYearSection(year, papersByYear[year]);
      timelineContainer.appendChild(yearSection);
    });
  }
  
  function createYearSection(year, papers) {
    const yearDiv = document.createElement('div');
    yearDiv.className = 'timeline-year';
    
    // Year label
    const yearLabel = document.createElement('div');
    yearLabel.className = 'timeline-year-label';
    yearLabel.textContent = year;
    yearDiv.appendChild(yearLabel);
    
    // Papers container
    const papersContainer = document.createElement('div');
    papersContainer.className = 'timeline-papers';
    
    papers.forEach(paper => {
      const paperElement = createPaperDot(paper);
      papersContainer.appendChild(paperElement);
    });
    
    yearDiv.appendChild(papersContainer);
    return yearDiv;
  }
  
  function createPaperDot(paper) {
    const paperDiv = document.createElement('div');
    paperDiv.className = `timeline-paper ${paper.status.replace('_', '-')}`;
    paperDiv.dataset.paperId = paper.id;
    paperDiv.dataset.type = paper.type.replace('_', '-');
    paperDiv.dataset.domain = paper.domain.replace(' ', '-').toLowerCase();
    paperDiv.dataset.status = paper.status.replace('_', '-');
    
    // Create dot with proper classes
    const dot = document.createElement('div');
    dot.className = `paper-dot ${paper.type.replace('_', '-')} ${paper.domain.replace(' ', '-').toLowerCase()}`;
    
    // Create tooltip
    const tooltip = document.createElement('div');
    tooltip.className = 'paper-tooltip';
    tooltip.textContent = paper.title;
    
    paperDiv.appendChild(dot);
    paperDiv.appendChild(tooltip);
    
    // Add click handler
    paperDiv.addEventListener('click', function() {
      if (paper.pdf_link) {
        window.open(paper.pdf_link, '_blank');
      } else if (paper.external_link) {
        window.open(paper.external_link, '_blank');
      }
    });
    
    return paperDiv;
  }
  
  function initializeFilters() {
    const filterItems = document.querySelectorAll('.filter-item');
    
    filterItems.forEach(item => {
      item.addEventListener('change', function() {
        updateTimelineFilter();
      });
    });
  }
  
  function updateTimelineFilter() {
    const typeFilter = document.querySelector('input[name="type"]:checked');
    const domainFilter = document.querySelector('input[name="domain"]:checked');
    const statusFilter = document.querySelector('input[name="status"]:checked');
    
    const selectedType = typeFilter ? typeFilter.value : 'all';
    const selectedDomain = domainFilter ? domainFilter.value : 'all';
    const selectedStatus = statusFilter ? statusFilter.value : 'all';
    
    const timelinePapers = document.querySelectorAll('.timeline-paper');
    
    timelinePapers.forEach(paper => {
      const paperType = paper.dataset.type;
      const paperDomain = paper.dataset.domain;
      const paperStatus = paper.dataset.status;
      
      let shouldShow = true;
      
      if (selectedType !== 'all' && paperType !== selectedType) {
        shouldShow = false;
      }
      
      if (selectedDomain !== 'all' && paperDomain !== selectedDomain) {
        shouldShow = false;
      }
      
      if (selectedStatus !== 'all' && paperStatus !== selectedStatus) {
        shouldShow = false;
      }
      
      if (shouldShow) {
        paper.classList.remove('filtered');
      } else {
        paper.classList.add('filtered');
      }
    });
  }
  
  // Sync with existing gallery filter if present
  function syncWithGalleryFilter() {
    const galleryItems = document.querySelectorAll('.research-item');
    const observer = new MutationObserver(function(mutations) {
      mutations.forEach(function(mutation) {
        if (mutation.type === 'attributes' && mutation.attributeName === 'style') {
          updateTimelineFilter();
        }
      });
    });
    
    galleryItems.forEach(item => {
      observer.observe(item, { attributes: true });
    });
  }
  
  // Initialize sync if gallery exists
  if (document.querySelector('.research-item')) {
    syncWithGalleryFilter();
  }
});