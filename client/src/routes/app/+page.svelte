<script lang="ts">
	import { page } from '$app/stores';

	let databases = [
		{
			name: 'Database 1',
			lastTransaction: '2023-09-01',
			created: '2023-01-15',
			status: 'active',
			storageUsed: 383 // bytes
		},
		{
			name: 'Database 2',
			lastTransaction: '2023-09-05',
			created: '2023-02-20',
			status: 'warning',
			storageUsed: 823548 // bytes
		},
		{
			name: 'Database 3',
			lastTransaction: '2023-09-10',
			created: '2023-03-25',
			status: 'critical',
			storageUsed: 1373741824 // bytes
		},
		{
			name: 'Database 1',
			lastTransaction: '2023-09-01',
			created: '2023-01-15',
			status: 'active',
			storageUsed: 383 // bytes
		},
		{
			name: 'Database 2',
			lastTransaction: '2023-09-05',
			created: '2023-02-20',
			status: 'warning',
			storageUsed: 823548 // bytes
		},
		{
			name: 'Database 3',
			lastTransaction: '2023-09-10',
			created: '2023-03-25',
			status: 'critical',
			storageUsed: 1373741824 // bytes
		},
		{
			name: 'Database 1',
			lastTransaction: '2023-09-01',
			created: '2023-01-15',
			status: 'active',
			storageUsed: 383 // bytes
		},
		{
			name: 'Database 2',
			lastTransaction: '2023-09-05',
			created: '2023-02-20',
			status: 'warning',
			storageUsed: 823548 // bytes
		},
		{
			name: 'Database 3',
			lastTransaction: '2023-09-10',
			created: '2023-03-25',
			status: 'critical',
			storageUsed: 1373741824 // bytes
		}
	];

	function formatDate(dateString: string): string {
		const options: Intl.DateTimeFormatOptions = { day: 'numeric', month: 'long', year: 'numeric' };
		return new Date(dateString).toLocaleDateString(undefined, options);
	}

	function getStatusColor(status: string): string {
		switch (status) {
			case 'active':
				return 'bg-green-500';
			case 'warning':
				return 'bg-yellow-500';
			case 'critical':
				return 'bg-red-500';
			default:
				return 'bg-gray-500';
		}
	}

	function formatStorage(bytes: number): string {
		const units = ['bytes', 'KB', 'MB', 'GB', 'TB'];
		let unitIndex = 0;
		let value = bytes;

		while (value >= 1024 && unitIndex < units.length - 1) {
			value /= 1024;
			unitIndex++;
		}

		const formattedValue = value.toFixed(2);
		return `${parseFloat(formattedValue)} ${units[unitIndex]}`;
	}
</script>

<div>
	<div class="flex h-[50px] items-center justify-between border-b border-zinc-300 px-3">
		<p>Database Manager</p>
		<div class="flex items-center gap-2">
			<button class="rounded-lg bg-zinc-700 px-2 py-1 font-medium text-white">New Database</button>
			<button class="rounded-lg border border-zinc-400 bg-zinc-100 px-2 py-1 font-medium text-black"
				>New Server</button
			>
		</div>
	</div>
	<div
		class="m-3 grid grid-cols-1 gap-3 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 2xl:grid-cols-5"
	>
		{#each databases as db}
			<div
				class="card cursor-pointer rounded-lg border border-zinc-200 bg-zinc-50 p-3 hover:bg-zinc-100"
			>
				<div class="mb-2 flex items-center justify-between">
					<p class="mr-2">{db.name}</p>
					<span class="-mt-2 h-2 w-2 rounded-full {getStatusColor(db.status)}"></span>
				</div>
				<p class="mb-2 text-sm text-zinc-500">
					Storage Used: {formatStorage(db.storageUsed)}
				</p>
				<p class="text-sm text-zinc-500">
					Last Transaction: {formatDate(db.lastTransaction)}
				</p>
				<p class="text-sm text-zinc-500">
					Created: {formatDate(db.created)}
				</p>
			</div>
		{/each}
	</div>
	<details class="m-3 hidden rounded-lg border border-zinc-200 bg-zinc-100 p-3">
		<summary>User Details</summary>
		<pre>
       {JSON.stringify(JSON.parse(JSON.stringify($page.data.session?.user)), null, 2)}
      </pre>
	</details>
</div>
