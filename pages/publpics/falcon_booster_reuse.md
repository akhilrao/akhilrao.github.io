---
layout: frontpage
title: Pushing the envelope on reusability
---

{% assign current_id = "falcon_booster_reuse" %}
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

![A History of Falcon Booster Reuse](../../assets/bigpublpics/falcon_booster_reuse.png)

**How many times has SpaceX reused Falcon boosters?** &mdash; The picture plots the number of times each Falcon booster has flown, whether on a Falcon 9 (solo) or a Falcon Heavy (as one of three), using [2023 data from Jonathan McDowell's General Catalog of Artificial Space Objects](https://planet4589.org/space/gcat/). By late 2023, 4 boosters had flown 19 times and the median booster had flown 12 times.