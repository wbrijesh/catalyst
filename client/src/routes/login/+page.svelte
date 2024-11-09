<script lang="ts">
	import { signIn, signOut } from '@auth/sveltekit/client';
	import { page } from '$app/stores';
	import { goto } from '$app/navigation';
	import { onMount } from 'svelte';

	const handleSignIn = () => {
		signIn('github');
	};

	const handleSignOut = () => {
		signOut();
	};

	const redirectToApp = () => {
		goto('/app');
	};

	onMount(() => {
		if ($page.data.session?.user) {
			redirectToApp();
		}
	});
</script>

<div class="flex min-h-screen flex-col items-center justify-center">
	{#if $page.data.session}
		<p class="mb-3 text-2xl">Welcome, {$page.data.session.user?.name}</p>
		<p class="mb-6 max-w-lg text-center text-neutral-700">
			You are now signed in. Enjoy using Catalyst to solve your development challenges.
		</p>
		<button
			on:click={redirectToApp}
			aria-label="Go to App"
			class="mb-3 rounded bg-orange-600 px-3 py-2 text-white">Go to App</button
		>
		<button on:click={handleSignOut} aria-label="Sign Out" class="text-neutral-500">Sign Out</button
		>
	{:else}
		<p class="mb-3 text-2xl">Welcome to Catalyst</p>
		<p class="mb-6 max-w-lg text-center text-neutral-700">
			Catalyst is a developer toolkit designed to solve real problems that existing tools overlook.
			It’s focused on delivering practical solutions for everyday development challenges, helping
			you avoid frustration and focus on what you do best: writing code.
		</p>
		<button
			on:click={handleSignIn}
			aria-label="Sign In"
			class="rounded bg-gray-800 px-3 py-2 text-white">Sign In</button
		>
	{/if}
</div>
