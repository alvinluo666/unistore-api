<?php

namespace Database\Factories;

use App\Models\MiddleCategory;
use Illuminate\Database\Eloquent\Factories\Factory;

class MiddleCategoryFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = MiddleCategory::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'root_id' => $this->faker->randomElement($array=array(1,2)),
            'name' => 'အမျိုးအစား'
        ];
    }
}
