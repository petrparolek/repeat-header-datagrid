<?php
namespace App\Presenters;

use Nette;
use App\Model\InvoicesManager;
use Ublaboo\DataGrid\DataGrid;
use Ublaboo\NetteDatabaseDataSource\NetteDatabaseDataSource;

class HomepagePresenter extends BasePresenter
{

	/**
	* @var Nette\Database\Context
	* @inject
	*/
   public $ndb;

	public function createComponentInvoicesGrid($name)
	{
		/**
		* @type DataGrid
		*/
		$grid = new DataGrid($this, $name);

		$query = 'SELECT * FROM invoices';

		/**
		 * @var Ublaboo\NetteDatabaseDataSource\NetteDatabaseDataSource
		 * 
		 * @param Nette\Database\Context
		 * @param $query
		 * @param $params|NULL
		 */
		$datasource = new NetteDatabaseDataSource($this->ndb, $query);

		$grid->setDataSource($datasource);

		$grid->addColumnText('no', 'Číslo')
			->setSortable()
			->setSortableResetPagination();

		$grid->addColumnText('customer_subject', 'Dodavatel')
			->setSortable()
			->setSortableResetPagination();

		$grid->addColumnDateTime('issued_date', 'Datum vystavení')
			->setSortable()
			->setSortableResetPagination();

		$currency = ['Kč'];

		$grid->addColumnText('total_price', 'Částka');

		$grid->addGroupAction('ublaboo_datagrid.delete')->onSelect[] = [$this,
			'deleteInvoices'];

		$grid->setDefaultSort(['issuedDate' => 'DESC'], FALSE);
		$grid->setRefreshUrl(FALSE);

		$grid->setColumnsHideable();

		$grid->setTemplateFile(__DIR__ . '/templates/datagrid/custom_datagrid_template.latte');
	}
}
