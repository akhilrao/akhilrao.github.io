---
layout: frontpage
title: An Index of Space Economy Manufacturing Plant Utilization
---

{% assign current_id = "sempi_fig1_highfill_rao_2025" %}
{% assign current_viz = site.data.visualizations.visualizations | where: "id", current_id | first %}

<div class="navbar">
  <div class="navbar-inner">
      <ul class="nav">
          {% if current_viz.prev %}
          {% assign prev_viz = site.data.visualizations.visualizations | where: "id", current_viz.prev | first %}
          <li><a href="{{ current_viz.prev }}.html">← prev</a></li>
          {% endif %}
          <li><a href="../../pages/visualizations.html">all visualizations</a></li>
          {% if current_viz.next %}
          {% assign next_viz = site.data.visualizations.visualizations | where: "id", current_viz.next | first %}
          <li><a href="{{ current_viz.next }}.html">next →</a></li>
          {% endif %}
      </ul>
  </div>
</div>

![An Index of Space Economy Manufacturing Plant Utilization](../../assets/bigpublpics/sempi_fig1_highfill_rao_2025.png.png)

**How close to capacity is US space economy manufacturing plant?** &mdash; 

“Manufacturing plant utilization” is the percentage of the total production capability of a manufacturing facility that was used. "Space economy manufacturing plant" covers manufacturing facilities producing goods and services that are used in space, or directly support those used in space, as defined by BEA. The space economy manufacturing plant utilization index, SEMPI, is a new measure of U.S. space economy manufacturing plant utilization constructed from publicly available data. See [Highfill and Rao (2025)](https://www.bea.gov/sites/default/files/papers/BEA-WP2025-5.pdf) for details.