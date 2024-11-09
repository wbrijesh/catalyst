<script>
	import {
		ChevronDown,
		Database,
		Terminal,
		Package,
		Cloud,
		Shield,
		Monitor,
		Plug,
		Lock,
		Telescope,
		ChartNoAxesColumn,
		Box,
		Asterisk
	} from 'lucide-svelte';
	import { signOut } from '@auth/sveltekit/client';
	import { page } from '$app/stores';

	const handleSignOut = () => {
		signOut();
	};

	// Sections data
	const mainItems = [
		{ icon: Database, label: 'Database' },
		{ icon: Terminal, label: 'Shell scipts' },
		{ icon: Lock, label: 'Authentication' },
		{ icon: Telescope, label: 'Observability' },
		{ icon: ChartNoAxesColumn, label: 'Analytics' },
		{ icon: Monitor, label: 'Uptime Monitoring' },
		{ icon: Box, label: 'CDN' }
	];

	const listItems = [
		{ icon: Package, label: 'Packages' },
		{ icon: Cloud, label: 'Cloud Services' },
		{ icon: Shield, label: 'Security' },
		{ icon: Monitor, label: 'Monitoring' },
		{ icon: Plug, label: 'Integrations' }
	];

	let isListsExpanded = true;
</script>

<div class="sidebar flex h-screen w-72 flex-col border-r border-neutral-600 bg-zinc-700 font-sans">
	<header class="header flex h-[50px] items-center border-b border-neutral-600 px-3">
		<div class="logo-section flex cursor-pointer items-center gap-0.5">
			<Asterisk class="h-6 w-6 text-white" />
			<span class="company-name geist-mono-font text mt-0.5 font-medium text-white">CATALYST</span>
		</div>
	</header>

	<nav class="navigation flex-1 overflow-y-auto p-2">
		{#each mainItems as item}
			<a
				href="#{item.label.toLowerCase()}"
				class="nav-item flex items-center gap-3 rounded px-1.5 py-1 text-sm text-neutral-300 no-underline transition-colors duration-200 hover:bg-neutral-600"
			>
				<span class="icon rounded border border-neutral-500 bg-neutral-600 p-1 text-neutral-300"
					><item.icon size={16} /></span
				>
				<span class="label">{item.label}</span>
			</a>
		{/each}

		<div class="section my-2">
			<button
				class="section-header flex w-full cursor-pointer items-center border-none bg-none p-2 text-xs text-neutral-400"
				on:click={() => (isListsExpanded = !isListsExpanded)}
			>
				<span>Lists</span>
				<ChevronDown class="chevron" />
				<div class="add-button ml-auto h-5 w-5 cursor-pointer rounded bg-none opacity-0">+</div>
			</button>
			{#if isListsExpanded}
				{#each listItems as item}
					<a
						href="#{item.label.toLowerCase()}"
						class="nav-item flex items-center gap-3 rounded px-1.5 py-1 text-sm text-neutral-300 no-underline transition-colors duration-200 hover:bg-neutral-600"
					>
						<span class="icon rounded border border-neutral-500 bg-purple-500 p-1 text-white"
							><item.icon size={16} /></span
						>
						<span class="label">{item.label}</span>
					</a>
				{/each}
			{/if}
		</div>
	</nav>

	<footer class="footer border-t border-neutral-600 p-4">
		<div class="user-section flex items-center justify-between gap-2 p-2 text-sm text-neutral-400">
			<span class="user-name text-white">{$page.data.session?.user?.name}</span>
			<button on:click={handleSignOut} aria-label="Sign Out" class="text-neutral-400"
				>Sign Out</button
			>
		</div>
	</footer>
</div>
