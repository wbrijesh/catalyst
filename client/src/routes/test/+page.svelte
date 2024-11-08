<script>
	let count = 0;

	function incrementCount() {
		count += 1;
	}

	function decrementCount() {
		count -= 1;
	}
</script>

<div class="m-5 space-y-2">
	<h1>Count: {count}</h1>
	<div class="space-x-2">
		<button
			class="rounded-md bg-neutral-200 px-2 py-1 text-sm font-medium text-neutral-800"
			on:click={incrementCount}>Increment</button
		>
		<button
			class="rounded-md bg-neutral-200 px-2 py-1 text-sm font-medium text-neutral-800"
			on:click={decrementCount}>Decrement</button
		>
	</div>
</div>
