(function(){
  if (location.hostname.indexOf('essycreations.co.tz') === -1) return;
  if (document.getElementById('essy-admin-btn')) return;
  var s=document.createElement('style');s.textContent='.essy-download-app{display:none!important}';(document.head||document.documentElement).appendChild(s);
  if (/^\/(login|admin|dashboard)/i.test(location.pathname)) return;
  var b = document.createElement('a');
  b.id = 'essy-admin-btn';
  b.href = 'https://essycreations.co.tz/login';
  b.textContent = '🔒 Admin Login';
  b.setAttribute('style', [
    'position:fixed','right:16px','bottom:calc(20px + env(safe-area-inset-bottom))','z-index:2147483647',
    'background:#D4AF37','color:#111','font:700 14px Lato,Arial,sans-serif','padding:12px 18px',
    'border-radius:999px','text-decoration:none','box-shadow:0 6px 18px rgba(0,0,0,.45)'
  ].join(';'));
  (document.body || document.documentElement).appendChild(b);
})();
