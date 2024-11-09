<script lang="ts">
	import '../app.css';
	import Sidebar from '../components/Sidebar.svelte';
	import { onMount } from 'svelte';
	import { page } from '$app/stores';
	import { writable } from 'svelte/store';

	let { children } = $props();
	const showSidebar = writable<boolean>(false);
	const nonDashboardRoutes = ['/login'];

	onMount(() => {
		const unsubscribe = page.subscribe(($page) => {
			showSidebar.set(!nonDashboardRoutes.some((route) => $page.url.pathname.startsWith(route)));
		});
		return () => unsubscribe();
	});
</script>

{#if $showSidebar}
	<main class="flex">
		<Sidebar />
		<div class="flex-1">
			{@render children()}
		</div>
	</main>
{:else}
	{@render children()}
{/if}
