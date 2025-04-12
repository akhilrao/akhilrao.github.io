---
layout: frontpage
title: Water allocation trading in Australia, 2008--2019
---

{% assign current_id = "govt_vs_nongovt_trades" %}
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

![Govt and non-govt water allocation trading in Australia, 2008--2019](../../assets/bigpublpics/govt_vs_nongovt_trades.png)

**How does allocation trading vary by trading entity type?** &mdash; The figure shows [water allocation trading](http://www.bom.gov.au/water/market/about.shtml) in Australia from 2008 to 2019. Panel a shows the average number of megaliters traded every month of the year over the sample period, split by whether the trade was conducted by a governmental entity (typically recorded with zero price) or a private entity (typically recorded with a positive price). Governmental trades are generally to maintain hydrological stability, and are both more variable than private trading and higher volume in the latter half of the year.

Panel b shows allocation trades in price-quantity space (both in log base 10). The plot is consistent with water supply curve shifting more year-to-year than the water demand curve. Later years seem to see slightly less price variability than earlier years.

The data were downloaded from the Bureau of Meteorology's [water information dashboard](http://www.bom.gov.au/water/dashboards/#/water-markets/national/state/at).
