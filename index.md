---
layout: frontpage
title: Akhil Rao
description: Akhil Rao is a person.
keywords: Rao, environmental economics, resource economics, space, applied theory, computational economics
---

<div class="navbar">
  <div class="navbar-inner">
      <ul class="nav">
          <li><a href="{{ BASE_PATH }}/assets/rao_cv.pdf">cv</a></li>
          <li><a href="https://scholar.google.com/citations?user=zYJ2IXQAAAAJ&hl=en">google scholar</a></li>
          <li><a href="https://github.com/akhilrao">github</a></li>
          <li><a href="https://www.linkedin.com/in/akhil-rao-544b126a/">linkedin</a></li>
          <!-- <li><a href="https://akhilrao.substack.com">substack</a></li>       -->
          <li><a href="{{ BASE_PATH }}/blog/">blog</a></li>      
      </ul>
  </div>
</div>

{% assign featured_items = site.data.visualizations.visualizations | where: "featured", true | limit: 4 %}

<style>
  /* Force equal sizing for both columns */
  .wide td {
    width: 50%;
    box-sizing: border-box;
  }
  .wide img {
    width: 100%;
    height: auto;
    max-height: 400px;
    object-fit: contain;
  }
</style>

<table class="wide">
<tr>
  <td class="left">
    <a href="{{ BASE_PATH }}/pages/publpics/{{ featured_items[0].id }}.html">
        <img src="{{ featured_items[0].thumbnail }}" alt="{{ featured_items[0].alt }}" title="{{ featured_items[0].title }}"/>
    </a>
  </td>
  <td class="right">
    <a href="{{ BASE_PATH }}/pages/publpics/{{ featured_items[1].id }}.html">
        <img src="{{ featured_items[1].thumbnail }}" alt="{{ featured_items[1].alt }}" title="{{ featured_items[1].title }}"/>
    </a>
  </td>
</tr>
<tr>
  <td class="left">
    <a href="{{ BASE_PATH }}/pages/publpics/{{ featured_items[2].id }}.html">
        <img src="{{ featured_items[2].thumbnail }}" alt="{{ featured_items[2].alt }}" title="{{ featured_items[2].title }}"/>
    </a>
  </td>
  <td class="right">
    <a href="{{ BASE_PATH }}/pages/publpics/{{ featured_items[3].id }}.html">
        <img src="{{ featured_items[3].thumbnail }}" alt="{{ featured_items[3].alt }}" title="{{ featured_items[3].title }}"/>
    </a>
  </td>
</tr>
</table>

<div class="view-all-container">
  <a href="{{ BASE_PATH }}/pages/visualizations.html" class="view-all-link">View all pictures →</a>
</div>