(() => {
  const container = document.querySelector('#discussion .giscus');
  const root = document.documentElement;

  const updateTheme = () => {
    const frame = container.querySelector('iframe.giscus-frame');
    frame?.contentWindow?.postMessage({
      giscus: { setConfig: { theme: root.dataset.theme } },
    }, 'https://giscus.app');
  };

  container.addEventListener('load', updateTheme, true);
  new MutationObserver(updateTheme).observe(root, {
    attributes: true,
    attributeFilter: ['data-theme'],
  });
  updateTheme();
})();
