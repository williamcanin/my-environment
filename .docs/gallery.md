---
layout: default
title: Galeria de Temas
permalink: /gallery/
---

<style>
.theme-gallery { margin-top: 1rem; }
.theme-gallery .back-link { display: inline-block; margin-bottom: 2rem; color: #3aa99f; text-decoration: none; font-weight: 600; }
.theme-gallery .back-link:hover { text-decoration: underline; }
.theme-gallery .theme-block { margin-bottom: 3rem; }
.theme-gallery .theme-block h2 { margin-bottom: .25rem; }
.theme-gallery .theme-block .theme-type { font-size: .85rem; color: #888; margin: 0 0 .9rem; }
.theme-gallery .thumb-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(180px, 1fr)); gap: .75rem; }
.theme-gallery .thumb { display: block; border-radius: 8px; overflow: hidden; border: 1px solid rgba(0,0,0,.1); transition: transform .15s ease, box-shadow .15s ease, border-color .15s ease; }
.theme-gallery .thumb:hover { transform: translateY(-3px); box-shadow: 0 8px 18px rgba(0,0,0,.18); border-color: #3aa99f; }
.theme-gallery .thumb img { display: block; width: 100%; height: 130px; object-fit: cover; }
.theme-gallery .lightbox { position: fixed; inset: 0; display: flex; align-items: center; justify-content: center; background: rgba(10,10,10,.94); opacity: 0; pointer-events: none; transition: opacity .2s ease; z-index: 1000; }
.theme-gallery .lightbox:target { opacity: 1; pointer-events: auto; }
.theme-gallery .lightbox img { max-width: 90vw; max-height: 85vh; border-radius: 6px; box-shadow: 0 10px 40px rgba(0,0,0,.6); }
.theme-gallery .lightbox-close { position: absolute; top: 1.25rem; right: 1.75rem; font-size: 2.25rem; line-height: 1; color: #fff; text-decoration: none; opacity: .85; }
.theme-gallery .lightbox-close:hover { opacity: 1; color: #3aa99f; }
.theme-gallery .lightbox-arrow { position: absolute; top: 50%; transform: translateY(-50%); font-size: 2.75rem; color: #fff; text-decoration: none; padding: .5rem 1.1rem; user-select: none; opacity: .8; line-height: 1; }
.theme-gallery .lightbox-arrow:hover { opacity: 1; color: #3aa99f; }
.theme-gallery .lightbox-prev { left: .5rem; }
.theme-gallery .lightbox-next { right: .5rem; }
.theme-gallery .lightbox-counter { position: absolute; bottom: 1.25rem; left: 50%; transform: translateX(-50%); color: #fff; font-size: .85rem; opacity: .7; letter-spacing: .03em; }
</style>

<div class="theme-gallery">
<a class="back-link" href="{{ '/' | relative_url }}">&larr; Voltar para a documentação</a>

<p>Galeria com prévias de todos os temas do <strong>my-environment</strong>. Clique em qualquer miniatura para abrir em tela cheia e navegue entre as imagens do mesmo tema usando as setas.</p>

<!--
  PADRÃO DE PASTAS ESPERADO (ajuste os nomes de arquivo conforme os seus):
  .docs/images/themes/<slug-do-tema>/preview-1.png
  .docs/images/themes/<slug-do-tema>/preview-2.png
  .docs/images/themes/<slug-do-tema>/preview-3.png

  Para adicionar mais imagens num tema: duplique o bloco <a class="thumb"> e o bloco
  <div class="lightbox">, ajuste o número (preview-4, preview-5...) e corrija os
  href de "prev"/"next" de TODAS as imagens daquele tema para manter o loop fechado.
-->

<div class="theme-block">
<h2>Blasphemous - Echoes Of Salt</h2>
<p class="theme-type">Escuro teal/cyan</p>
<div class="thumb-grid">
<a href="#blasphemous-echoes-of-salt-1" class="thumb"><img src="{{ '/.docs/images/themes/blasphemous-echoes-of-salt/preview-1.png' | relative_url }}" alt="Blasphemous - Echoes Of Salt, prévia 1" loading="lazy"></a>
<a href="#blasphemous-echoes-of-salt-2" class="thumb"><img src="{{ '/.docs/images/themes/blasphemous-echoes-of-salt/preview-2.png' | relative_url }}" alt="Blasphemous - Echoes Of Salt, prévia 2" loading="lazy"></a>
<a href="#blasphemous-echoes-of-salt-3" class="thumb"><img src="{{ '/.docs/images/themes/blasphemous-echoes-of-salt/preview-3.png' | relative_url }}" alt="Blasphemous - Echoes Of Salt, prévia 3" loading="lazy"></a>
<a href="#blasphemous-echoes-of-salt-4" class="thumb"><img src="{{ '/.docs/images/themes/blasphemous-echoes-of-salt/preview-4.png' | relative_url }}" alt="Blasphemous - Echoes Of Salt, prévia 4" loading="lazy"></a>
<a href="#blasphemous-echoes-of-salt-5" class="thumb"><img src="{{ '/.docs/images/themes/blasphemous-echoes-of-salt/preview-5.png' | relative_url }}" alt="Blasphemous - Echoes Of Salt, prévia 5" loading="lazy"></a>
<a href="#blasphemous-echoes-of-salt-6" class="thumb"><img src="{{ '/.docs/images/themes/blasphemous-echoes-of-salt/preview-6.png' | relative_url }}" alt="Blasphemous - Echoes Of Salt, prévia 6" loading="lazy"></a>
</div>
</div>


<!-- Lightboxes: um <div class="lightbox"> por imagem. prev/next apontam para os IDs
     das outras imagens do MESMO tema, fechando o ciclo (última -> primeira e vice-versa). -->
<div class="lightbox" id="blasphemous-echoes-of-salt-1">
<a href="#" class="lightbox-close" aria-label="Fechar">&times;</a>
<a href="#blasphemous-echoes-of-salt-3" class="lightbox-arrow lightbox-prev" aria-label="Anterior">&#8249;</a>
<img src="{{ '/.docs/images/themes/blasphemous-echoes-of-salt/preview-1.png' | relative_url }}" alt="Blasphemous - Echoes Of Salt, prévia 1">
<a href="#blasphemous-echoes-of-salt-2" class="lightbox-arrow lightbox-next" aria-label="Próxima">&#8250;</a>
<span class="lightbox-counter">1 / 6</span>
</div>
<div class="lightbox" id="blasphemous-echoes-of-salt-2">
<a href="#" class="lightbox-close" aria-label="Fechar">&times;</a>
<a href="#blasphemous-echoes-of-salt-1" class="lightbox-arrow lightbox-prev" aria-label="Anterior">&#8249;</a>
<img src="{{ '/.docs/images/themes/blasphemous-echoes-of-salt/preview-2.png' | relative_url }}" alt="Blasphemous - Echoes Of Salt, prévia 2">
<a href="#blasphemous-echoes-of-salt-3" class="lightbox-arrow lightbox-next" aria-label="Próxima">&#8250;</a>
<span class="lightbox-counter">2 / 6</span>
</div>
<div class="lightbox" id="blasphemous-echoes-of-salt-3">
<a href="#" class="lightbox-close" aria-label="Fechar">&times;</a>
<a href="#blasphemous-echoes-of-salt-2" class="lightbox-arrow lightbox-prev" aria-label="Anterior">&#8249;</a>
<img src="{{ '/.docs/images/themes/blasphemous-echoes-of-salt/preview-3.png' | relative_url }}" alt="Blasphemous - Echoes Of Salt, prévia 3">
<a href="#blasphemous-echoes-of-salt-1" class="lightbox-arrow lightbox-next" aria-label="Próxima">&#8250;</a>
<span class="lightbox-counter">3 / 6</span>
</div>
<div class="lightbox" id="blasphemous-echoes-of-salt-4">
<a href="#" class="lightbox-close" aria-label="Fechar">&times;</a>
<a href="#blasphemous-echoes-of-salt-3" class="lightbox-arrow lightbox-prev" aria-label="Anterior">&#8249;</a>
<img src="{{ '/.docs/images/themes/blasphemous-echoes-of-salt/preview-4.png' | relative_url }}" alt="Blasphemous - Echoes Of Salt, prévia 4">
<a href="#blasphemous-echoes-of-salt-2" class="lightbox-arrow lightbox-next" aria-label="Próxima">&#8250;</a>
<span class="lightbox-counter">4 / 6</span>
</div>
<div class="lightbox" id="blasphemous-echoes-of-salt-5">
<a href="#" class="lightbox-close" aria-label="Fechar">&times;</a>
<a href="#blasphemous-echoes-of-salt-4" class="lightbox-arrow lightbox-prev" aria-label="Anterior">&#8249;</a>
<img src="{{ '/.docs/images/themes/blasphemous-echoes-of-salt/preview-5.png' | relative_url }}" alt="Blasphemous - Echoes Of Salt, prévia 5">
<a href="#blasphemous-echoes-of-salt-3" class="lightbox-arrow lightbox-next" aria-label="Próxima">&#8250;</a>
<span class="lightbox-counter">5 / 6</span>
</div>
<div class="lightbox" id="blasphemous-echoes-of-salt-6">
<a href="#" class="lightbox-close" aria-label="Fechar">&times;</a>
<a href="#blasphemous-echoes-of-salt-5" class="lightbox-arrow lightbox-prev" aria-label="Anterior">&#8249;</a>
<img src="{{ '/.docs/images/themes/blasphemous-echoes-of-salt/preview-6.png' | relative_url }}" alt="Blasphemous - Echoes Of Salt, prévia 6">
<a href="#blasphemous-echoes-of-salt-4" class="lightbox-arrow lightbox-next" aria-label="Próxima">&#8250;</a>
<span class="lightbox-counter">6 / 6</span>
</div>

</div>
