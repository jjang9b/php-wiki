<p><strong>[mysq] Convert UTC timestamp</strong></p>

<p>select &nbsp;UTC_TIMESTAMP(), CURRENT_TIMESTAMP(), CONVERT_TZ(now(), @@session.time_zone, &#39;+00:00&#39;);</p>
